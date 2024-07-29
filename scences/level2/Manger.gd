extends Node

@onready var tile_map: TileMap = $"../TileMap"
@onready var camera_2d: Camera2D = $"../player/Camera2D"
@onready var timer: Timer = $"../Timer"
@onready var timer_2: Timer = $"../Timer2"
@onready var collision_shape_2d: CollisionShape2D = $"../TileMap/Detecter2/CollisionShape2D"

const bg= preload("res://art/audio/bg/十一月的雨.mp3")

var huo_pre=preload("res://scences/huo/huo.tscn")
var ci_pre=preload("res://scences/spike/ci.tscn")

func _ready() -> void:
	Audio.play(bg,true,false,0)
	
	#tween.parallel().tween_property(tile_map,"position",tile_map.position+Vector2(90,0),1)
	#此方法表示所有瓦片的矩形范围，返回矩形左上角坐标P和矩形的大小，有左上角坐标属性position和右下角坐标属性end
	var used:=tile_map.get_used_rect().grow(-1)
	var tile_size:=tile_map.tile_set.tile_size
	camera_2d.limit_bottom=used.end.y*tile_size.y
	camera_2d.limit_left=used.position.x*tile_size.x
	camera_2d.limit_right=used.end.x*tile_size.x
	camera_2d.limit_top=used.position.y*tile_size.y
	
	MapMananger.a=false
	MapMananger.b=false
	MapMananger.c=false
	MapMananger.d=false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass





func _on_detecter_body_entered(_body: Node2D) -> void:
	
	MapMananger.b=true


func _on_detecter_body_exited(_body: Node2D) -> void:
	

	await  get_tree().create_timer(1).timeout
	MapMananger.b=false
	MapMananger.c=true
	await  get_tree().create_timer(0.3).timeout
	
	MapMananger.d=true
	
	timer_2.start()
	

	#tile_map.global_position+=Vector2(90,0)
	#camera_2d.offset.x+=90
	await  get_tree().create_timer(2).timeout
	MapMananger.d=false
	MapMananger.c=false




func _on_detecter_2_body_entered(_body: Node2D) -> void:
	collision_shape_2d.call_deferred("set_disabled",true)
	var juLi=70
	for i in 12:
		await get_tree().create_timer(0.2).timeout
		var huo=huo_pre.instantiate()
		add_child(huo)
		huo.global_position=Vector2(1500-i*juLi,750)

	var huoYan=reverse_array(self.get_children())
	timer.start()
	for child in huoYan:
		if  get_tree() != null:
		
			if is_instance_valid(child):
				child.queue_free()
				await get_tree().create_timer(0.5).timeout

	huoYan.clear()

func reverse_array(array_to_reverse: Array) -> Array:
	var reversed_array = []
	var array_size = array_to_reverse.size()
	#包括参数(array_size-1),不包括-1，十二个数
	for i in range((array_size-1)  , -1 , -1):
		reversed_array.append(array_to_reverse[i])

	return reversed_array

func _on_timer_timeout() -> void:
	ci()
	pass
func ci():
	var cici=ci_pre.instantiate()
	cici.global_position=Vector2(650,600)
	add_child(cici)
	


func _on_timer_2_timeout() -> void:
	var tween=get_tree().create_tween()
	tween.tween_interval(0.1)
	#await  get_tree().create_timer(0.1).timeout
	tween.parallel().tween_property(tile_map,"position",tile_map.position+Vector2(90,0),1)
	tween.parallel().tween_property(camera_2d,"offset:x",camera_2d.offset.x+90,1)
