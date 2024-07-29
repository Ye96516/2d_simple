extends Sprite2D

@export var x:float=600
@export var y:float=0
var map:Node2D

func _ready() -> void:
	map=get_tree().get_first_node_in_group("map")
	
func _physics_process(delta: float) -> void:
	var screen=get_tree().root.size
	self.global_position+=Vector2(x*delta,y)
	if self.global_position.x>screen.x:
		self.queue_free()
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name=="map":
		self.queue_free()
