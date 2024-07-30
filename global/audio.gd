##可以全局播放音乐，不受场景变换的影响，由大佬陌上竹鼎力相助。
class_name wanyue extends Node


##播放音频
func play(stream:AudioStream, single:bool=false,is_release:bool=true,volume:float=0,) -> AudioStreamPlayer:
	if single:
		# 获取所有的audio节点
		var audio_list = get_children()
		for audio_node: AudioStreamPlayer in audio_list:
			if audio_node.stream.resource_path == stream.resource_path:
				audio_node.stream_paused=false
				return audio_node
				
	#创建播放器
	var audio=AudioStreamPlayer.new()
	#传入音频文件
	audio.volume_db=volume
	audio.stream=stream
	audio.finished.connect(finished.bind(audio,is_release))
	
	add_child(audio)
	audio.playing=true
	return audio

func pause(audio):
	audio.stream_paused=true

func contine(audio):
	audio.stream_paused=false

func stop(audio):
	audio.stop()
	audio.queue_free()

#此函数的参数是在连接信号的的时候传入的
##音乐播放完自动执行
func finished(audio,is_release):
	if is_release:
		audio.queue_free()
	audio.play()

##清除所有音乐
func clear():
	if not get_children().is_empty():
		var count=get_child_count()
		for i in range(count):
			var child=get_child(count-i-1)
			child.queue_free()
	else:
		return

##获取当前线程的线性音量 
func get_volume(bus_index:int):
	var db:=AudioServer.get_bus_volume_db(bus_index)
	return db_to_linear(db)

##需要注意传入的值是线性的。在这个项目中，值在滑块移动时传入
func set_volume(bus_index:int,v:float):
	var db:=linear_to_db(v)
	AudioServer.set_bus_volume_db(bus_index,db)
