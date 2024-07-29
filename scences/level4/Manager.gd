extends Node

const bg = preload("res://art/audio/bg/又到家了.mp3")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print("进入场景四")
	Audio.play(bg,true,false,0)
	MapMananger.b=true
	MapMananger.c=false
	MapMananger.d=false



func _on_detecter_body_entered(_body: Node2D) -> void:
	MapMananger.b=false


func _on_detecter_body_exited(_body: Node2D) -> void:
	if get_tree()!=null:
		await get_tree().create_timer(3).timeout
	MapMananger.b=true


func _on_detecter_2_body_entered(_body: Node2D) -> void:
	MapMananger.c=true


func _on_detecter_2_body_exited(_body: Node2D) -> void:
	MapMananger.c=false


func _on_detecter_3_body_entered(body: Node2D) -> void:
	body.global_position=Vector2(720,300)


func _on_detecter_4_body_entered(body: Node2D) -> void:
	body.global_position=Vector2(-50,420)


func _on_chuan_song_body_entered(body: Node2D) -> void:
	body.global_position=Vector2(-50,420)


func _on_detecter_5_body_entered(body: Node2D) -> void:
	body.global_position=Vector2(1812,125)



func _on_detecter_6_body_entered(_body: Node2D) -> void:
	MapMananger.d=true


func _on_detecter_6_body_exited(_body: Node2D) -> void:
	if get_tree()!=null:
		await get_tree().create_timer(2).timeout
	MapMananger.d=false
