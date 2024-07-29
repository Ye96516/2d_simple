extends Sprite2D

@export_file("*tscn") var next_level_path:String

func _ready() -> void:
	pass 


func _on_detecter_body_entered(body: Node2D) -> void:
	Audio.clear()
	var tween=create_tween()
	tween.tween_property(body,"modulate:a",0,1)
	#ScenceChange.next_scence=next_level_path
	tween.tween_callback(get_tree().change_scene_to_file.bind(next_level_path))


