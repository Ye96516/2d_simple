extends Node2D


@onready var cp: CollisionPolygon2D = $"../StaticBody2D/有小坡的多边"
@onready var player: Player = $"../player"
@onready var label: Label = $"../CanvasLayer/Label"
@onready var timer: Timer = $"../Timer"


var Yun1=preload("res://scences/yun/Yun1.tscn")
var yun_shuLiang:Array
var timer_time:int

func _ready() -> void:
	
	TranslationServer.set_locale("en")
	$"../StaticBody2D/Polygon2D2".polygon=cp.polygon
	pass
func _draw() -> void:
	draw_line(Vector2(0,800),Vector2(1800,800),Color.AQUAMARINE,2,true)
	draw_rect(Rect2(Vector2(0,800),Vector2(1800,300)),Color.AQUA)
	

func _on_timer_timeout() -> void:
	print(9)
	randomize()
	var posibility_x=randi_range(0, 1)
	var posibility_y=randi_range(0, 1)
	var posibility_y_y=randi_range(0, 4)
	var yun_x:float=randf_range(80,150) if posibility_x==0 else randf_range(-80,-150) 
	var yun_y:float=randf_range(0,20) if posibility_y==0 else randf_range(0,-20)
	
	if (posibility_y_y==0) or (posibility_y_y==1) or (posibility_y_y==2) or (posibility_y_y==3):
		yun_y=randf_range(0,20) if posibility_y==0 else randf_range(0,-20)
	else:
		yun_y=randf_range(20,30) if posibility_y==0 else randf_range(-30,-20)

	var yun=Yun1.instantiate()
	add_child(yun)
	yun.global_position=Vector2(player.global_position.x+yun_x,player.global_position.y+yun_y)
	yun_shuLiang.append(yun)


func _physics_process(delta: float) -> void:
	if player.global_position.y==-100:
		print("你已获得胜利")
	label.text=tr("当前海拔：")+str(int(player.global_position.y))

func _on_detecter_body_entered(body: Node2D) -> void:
	print(0)
	timer.start()
	timer.autostart=true
	$"../Detecter/CollisionShape2D".disabled=true
