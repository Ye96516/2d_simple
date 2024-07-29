extends Area2D

var player:CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.name=="player":
		body.is_die=true
		body.set_physics_process(false)
		await get_tree().create_timer(1).timeout
		if get_tree():
			get_tree().reload_current_scene()
		
		
