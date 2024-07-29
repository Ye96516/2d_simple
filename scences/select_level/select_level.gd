extends Control

@export var w=wanyue.new()

func _ready() -> void:
	w.clear()

func _on_button_2_pressed() -> void:
	if get_tree():
		get_tree().change_scene_to_file("res://scences/start_menu/start_menu.tscn")

func _on_button_pressed() -> void:
	if get_tree():
		get_tree().change_scene_to_file("res://scences/start_menu/start_menu.tscn")

func _exit_tree() -> void:
	w.clear()
