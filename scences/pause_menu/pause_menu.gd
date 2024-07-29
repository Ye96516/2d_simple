extends CanvasLayer

@onready var panel_2: Panel = $Panel2
@onready var h_slider: HSlider = $Panel2/HSlider



var is_stop:bool

func _ready() -> void:
	visible=false
	panel_2.hide()
	h_slider.editable=false

	
func _physics_process(delta: float) -> void:

	if Input.is_action_just_pressed("esc"):
		is_stop=!is_stop

	if is_stop:
		get_tree().paused=true
		visible=true
	else:
		get_tree().paused=false
		visible=false

func _on_button_pressed() -> void:
	is_stop=!is_stop
	if get_tree():
		get_tree().change_scene_to_file("res://scences/start_menu/start_menu.tscn")


func _on_button_2_pressed() -> void:
	is_stop=!is_stop
	ScenceChange.next_scence="res://scences/select_level/select_level.tscn"
	get_tree().change_scene_to_file("res://scences/loading/loading.tscn")

func _on_button_3_pressed() -> void:
	panel_2.show()
	h_slider.editable=true


func _on_panel_2_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index==MOUSE_BUTTON_LEFT and event.is_pressed():
		panel_2.hide()
		h_slider.editable=false


func _on_full_screen_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index==MOUSE_BUTTON_LEFT and event.is_pressed():
		is_stop=!is_stop


func _on_option_button_item_selected(index: int) -> void:
	if index==0:
		TranslationServer.set_locale("zh")
	if index==1:
		TranslationServer.set_locale("en")

