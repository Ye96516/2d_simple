@tool
extends SubViewportContainer

@onready var sub_viewport: SubViewport = $SubViewport
@export var level_scence:PackedScene

func _ready() -> void:
	Audio.clear()
	if level_scence: 
		if sub_viewport.get_child_count()!=0:
			sub_viewport.remove_child(sub_viewport.get_child(0))
		sub_viewport.add_child(level_scence.instantiate())


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index==MOUSE_BUTTON_LEFT:
			if get_tree():
				get_tree().change_scene_to_file("res://scences/level1/level_1.tscn")


func _on_sub_viewport_container_2_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index==MOUSE_BUTTON_LEFT:
			if get_tree():
				get_tree().change_scene_to_file("res://scences/level2/level_2.tscn")


func _on_sub_viewport_container_3_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index==MOUSE_BUTTON_LEFT:
			if get_tree():
				get_tree().change_scene_to_file("res://scences/level3/level_3.tscn")


func _on_sub_viewport_container_4_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index==MOUSE_BUTTON_LEFT:
			if get_tree():
				get_tree().change_scene_to_file("res://scences/level4/level_4.tscn")


func _on_sub_viewport_container_5gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index==MOUSE_BUTTON_LEFT:
			if get_tree():
				get_tree().change_scene_to_file("res://scences/level5/level_5.tscn")


func _on_sub_viewport_container_6_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index==MOUSE_BUTTON_LEFT:
			if get_tree():
				get_tree().change_scene_to_file("res://scences/level6/level_6.tscn")
