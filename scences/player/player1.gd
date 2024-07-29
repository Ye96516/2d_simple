class_name Player extends CharacterBody2D


var direction :float
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_die:bool

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	direction=Input.get_axis("a","d")
	
	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()
	
