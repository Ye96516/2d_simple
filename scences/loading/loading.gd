extends Control

@onready var progress_bar: ProgressBar = $ProgressBar


func _ready() -> void:
	Audio.clear()
	ResourceLoader.load_threaded_request(ScenceChange.next_scence)

func _process(delta: float) -> void:
	var progress =[]
	ResourceLoader.load_threaded_get_status(ScenceChange.next_scence,progress) 
	progress_bar.value=progress[0]*100
	
	if progress[0]==1:
		var packed_scence=ResourceLoader.load_threaded_get(ScenceChange.next_scence)
		get_tree().change_scene_to_packed(packed_scence)
