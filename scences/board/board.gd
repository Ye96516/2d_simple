extends AnimatableBody2D

@export var speed:float=900.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.





func _on_detecter_body_entered(body: Node2D) -> void:
	body.velocity.y=-speed
