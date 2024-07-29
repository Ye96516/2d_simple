extends HSlider

func _ready() -> void:

	#获取当前总线的线性音量值
	value=Audio.get_volume(0)
	
	#输入线性音量值并转化为db输出
	value_changed.connect(
		func (v:float):

			Audio.set_volume(0,v)
	)
