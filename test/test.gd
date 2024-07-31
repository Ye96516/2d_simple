
extends Node2D

const k:=1024.0
const m:=10.0
const c:=10.0

var velocity:Vector2=Vector2(0,0)

var base:Vector2
var object:Vector2

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	pass

func _draw() -> void:
	#draw_line(Vector2(0,0),get_global_mouse_position(),Color(0,0,0,1),3,1)
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("方形进入圆形")


func _on_area_2d_2_area_entered(area: Area2D) -> void:
	print("圆形进入方形")
