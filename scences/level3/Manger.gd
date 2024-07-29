extends Node

@onready var tile_map: TileMap = $"../TileMap"
@onready var player: CharacterBody2D = $"../player"

const bg = preload("res://art/audio/bg/与我同行.mp3")

var direction:int=-1
var g:int=980
var sca:int=3
func _ready() -> void:
	Audio.play(bg,true,false,0)

func _process(_delta: float) -> void:
	#在起跳时调整重力和地板
	if Input.is_action_just_pressed("k") and player.is_on_floor():
		direction=-direction
		g=-g
		sca=-sca
		player.up_direction=Vector2(0,direction)
		player.gravity=g
		player.scale=Vector2(3,sca)

