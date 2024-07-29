extends Control

@onready var option_button: OptionButton = $Panel/OptionButton
@onready var panel: Panel = $Panel
@onready var h_slider: HSlider = $Panel/HSlider

const bg= preload("res://art/audio/甜美的背景音乐.mp3")
var popup:PopupMenu

func _ready() -> void:
	TranslationServer.set_locale("zh")
	Audio.clear()
	Audio.play(bg,true,false,0)
	panel.hide()
	h_slider.editable=false
	popup=option_button.get_popup()
	

func _on_label_2_pressed() -> void:
	Audio.clear()
	ScenceChange.next_scence="res://scences/level1/level_1.tscn"
	get_tree().change_scene_to_file("res://scences/loading/loading.tscn")

func _on_label_pressed() -> void:
	ScenceChange.next_scence="res://scences/select_level/select_level.tscn"
	get_tree().change_scene_to_file("res://scences/loading/loading.tscn")

func _on_label_3_pressed() -> void:
	panel.show()
	h_slider.editable=true

func _on_panel_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index==MOUSE_BUTTON_LEFT and event.is_pressed():
		panel.hide()
		h_slider.editable=false
		

func _on_option_button_item_selected(index: int) -> void:
	if index==0:
		TranslationServer.set_locale("zh")
	elif index==1:
		TranslationServer.set_locale("en")
