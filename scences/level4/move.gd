extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween=create_tween()
	tween.set_loops()
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(self,"global_position",Vector2(984,550),2.5)
	tween.tween_property(self,"global_position",Vector2(984,30),2.5)

