extends Node

@onready var tile_map: TileMap = $"../TileMap"
var cif_pre=preload("res://scences/fly_ci/fly_ci.tscn")
var map1=preload("res://scences/map/map.tscn")
var p:Vector2
var r:Vector2
var i=1
var cishu:int=0
var ppp:int
var time_ci:int

const bg = preload("res://art/audio/bg/冰淇淋器乐组合.mp3")

func _ready() -> void:
	#print("进入场景六")
	
	Audio.play(bg,true,false,-10)
	set_physics_process(true)
	
func _on_timer_timeout() -> void:
	time_ci+=1
	for ii in 10:
		var cif=cif_pre.instantiate()
		add_child(cif)
		cif.global_position=Vector2(-10,50+ii*100)
		
	if time_ci>=5:
		for ii in 10:
			var ciff=cif_pre.instantiate()
			add_child(ciff)
			ciff.x=-600
			ciff.rotation_degrees=90
			ciff.global_position=Vector2(1750,50+ii*100)
		
func _input(_event):
	if Input.is_action_just_pressed("click") or Input.is_action_just_released("click"):  #鼠标点击
		var map=map1.instantiate()
		add_child(map)
		i+=1

		var mouse_global=get_parent().get_global_mouse_position()  #获取鼠标的全局位置

		if Input.is_action_just_pressed("click"):
			p=mouse_global
			#map.global_position=mouse_global

		if Input.is_action_just_released("click"):
			cishu=0
			r=mouse_global
		
			#g()
	if Input.is_action_just_released("ziSha"):
		
		if get_tree()!=null:
			get_tree().reload_current_scene()
				
func g():
	
	var juedui=abs(p-r)
	var top_left:Vector2=Vector2(
			min(p.x,r.x),
			min(p.y,r.y)
		)
	for ii in juedui.x/32:
		for iii in juedui.y/32:
			var map=map1.instantiate()
			add_child(map)
			map.position=Vector2(
					32*ii+top_left.x,
					32*iii+top_left.y
				)

func _physics_process(delta: float) -> void:
	if i%2 !=0 and i!=1 and cishu!=1  :
		cishu=cishu+1
		var juedui=abs(p-r)
	
		var top_left:Vector2=Vector2(
			min(p.x,r.x),
			min(p.y,r.y)
		)
		
		for ii in ceil(juedui.x/32):
			for iii in ceil(juedui.y/32):
				var map=map1.instantiate()
				add_child(map)
				map.position=Vector2(
					32*ii+top_left.x,
					32*iii+top_left.y
				)
func _exit_tree() -> void:
	Audio.clear()

