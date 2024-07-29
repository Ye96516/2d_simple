
extends Node2D

const k:=1024.0
const m:=10.0
const c:=10.0

var velocity:=Vector2.ZERO
var base:Vector2
var object:Vector2

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	pass
func _draw() -> void:
	draw_line(Vector2(0,0),get_global_mouse_position(),Color(0,0,0,1),3,1)

func _process(delta: float) -> void:
	queue_redraw()
