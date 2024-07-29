extends Node2D

var Yun1=preload("res://scences/yun/Yun1.tscn")
@onready var cp: CollisionPolygon2D = $"../StaticBody2D/有小坡的多边"
@onready var player: Player = $"../player"


#var DuoBian:PackedVector2Array=cp.polygon

func _ready() -> void:
	$"../StaticBody2D/Polygon2D2".polygon=cp.polygon
	pass
func _draw() -> void:
	draw_line(Vector2(0,800),Vector2(1800,800),Color.AQUAMARINE,2,true)
	draw_rect(Rect2(Vector2(0,800),Vector2(1800,300)),Color.AQUA)
	#draw_polygon(DuoBian,Color.AQUAMARINE,)

func _physics_process(delta: float) -> void:
	pass

	


func _on_detecter_2_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
