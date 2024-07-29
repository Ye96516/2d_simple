extends Node

var rise:bool
var board_pr:=preload("res://scences/board/board.tscn")
var state_time:float

@onready var icon: Sprite2D = $"../Icon"
@onready var tile_map: TileMap = $"../TileMap"
const GROOVY_SKA_FUN__ = preload("res://art/audio/bg/Groovy Ska Fun时间.mp3")
const MAJ_NEW_AGE__ = preload("res://art/audio/bg/Maj New Age钢琴.mp3")

func _ready() -> void:
	Audio.play(MAJ_NEW_AGE__,true,false,0)
	MapMananger.b=false
	MapMananger.d=false
	MapMananger.c=true

func _on_detecter_body_entered(body: Node2D) -> void:
	if body.name=="player":
		MapMananger.c=true
		MapMananger.b=true
		var board=board_pr.instantiate()
		call_deferred("add_child",board)
		board.global_position=Vector2(50,700)

func _on_detecter_body_exited(body: Node2D) -> void:
	await get_tree().create_timer(0.5).timeout
	if body.name=="player":
		MapMananger.b=false


func _on_detecter_2_body_entered(_body: Node2D) -> void:
	MapMananger.c=false


func _on_detecter_3_body_entered(body: Node2D) -> void:
	body.global_position=Vector2(1806,254)

func _on_detecter_4_body_entered(_body: Node2D) -> void:
	MapMananger.d=true
	
func _on_detecter_4_body_exited(_body: Node2D) -> void:
	await get_tree().create_timer(2.5).timeout
	MapMananger.d=false
