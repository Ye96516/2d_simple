extends Node2D

@onready var colors:Array=[$red,$green,$blue,$black,$white,$yellow,$orange]
@onready var red: Sprite2D = $red
@onready var green: Sprite2D = $green
@onready var blue: Sprite2D = $blue
@onready var black: Sprite2D = $black
@onready var white: Sprite2D = $white
@onready var yellow: Sprite2D = $yellow
@onready var orange: Sprite2D = $orange
@onready var player: Player = $"../player"


func _ready() -> void:
	init_spawn()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func init_spawn():
	randomize()
	var posibility=randi_range(1,7)
	var s_s:int=randi_range(200,110)
	var s_s1:int=randi_range(200,100)
	for i in colors:
		var random:=randi_range(0,1)
		if random==0:
			i.scale=Vector2(s_s,s_s)
		else:
			i.scale=Vector2(s_s1,s_s1)
		#i.global_position=Vector2(randi_range(player.global_position.x+700,player.global_position.x-700),randi_range(player.global_position.y+700,player.global_position.y-700))
		for ii in 2:
			var a=i.duplicate()
			add_child(a)
			a.global_position=Vector2(randi_range(0,4500),randi_range(0,1000))
		
func spawn():
	randomize()
	var s_s:int=randi_range(200,110)
	var s_s1:int=randi_range(200,100)
	for i in colors:
		var random:=randi_range(0,1)
		if random==0:
			i.scale=Vector2(s_s,s_s)
		else:
			i.scale=Vector2(randi_range(player.global_position.x+500,player.global_position.x-500),randi_range(player.global_position.y+300,player.global_position.y+70))
	
func _physics_process(delta: float) -> void:
	var sp_time:int
	if (player.global_position.y<100) and (sp_time==0):
		sp_time+=1
		spawn()
