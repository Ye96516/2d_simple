extends Node2D


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var detecter: Area2D = $anNiu/Detecter


func _on_detecter_body_entered(_body: Node2D) -> void:
	animation_player.play("dong")


func _on_detecter_body_exited(_body: Node2D) -> void:
	animation_player.play("jing")
