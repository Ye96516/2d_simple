extends Node2D

var Yun1=preload("res://scences/yun/Yun1.tscn")
@onready var cp: CollisionPolygon2D = $"../StaticBody2D/有小坡的多边"
@onready var player: Player = $"../player"
var pos:Array[Vector2]=[Vector2(0,0)]

#var DuoBian:PackedVector2Array=cp.polygon

func _ready() -> void:
	
	$"../StaticBody2D/Polygon2D2".polygon=cp.polygon
	pass
func _draw() -> void:
	draw_line(Vector2(0,800),Vector2(1800,800),Color.AQUAMARINE,2,true)
	draw_rect(Rect2(Vector2(0,800),Vector2(1800,300)),Color.AQUA)
	

func _on_timer_timeout() -> void:
	
	randomize()
	var posibility_x=randi_range(0, 1)
	var posibility_y=randi_range(0, 1)
	var yun_x:float=randf_range(100,150) if posibility_x==0 else randf_range(-100,-150)
	var yun_y:float=randf_range(0,100) if posibility_y==0 else randf_range(0,-100)
	var can_yun:bool=true
	
	for i in pos:
		var x_cha=i.x-(player.global_position.x+yun_x)
		var y_cha=i.y-(player.global_position.y+yun_y)
		
		if abs(x_cha)<5 or abs(y_cha)<5 :
			print(abs(x_cha),"    ",abs(y_cha))
			can_yun=false
	

	if can_yun:
		var yun=Yun1.instantiate()
		add_child(yun)
		yun.global_position=Vector2(player.global_position.x+yun_x,player.global_position.y+yun_y)
		pos.append(yun.global_position)
	


