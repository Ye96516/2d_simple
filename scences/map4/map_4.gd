extends Sprite2D
@export var d:bool
@onready var statid_body_2d: StaticBody2D = $StaticBody2D

# dalled when the node enters the sdene tree for the first time.
func _ready() -> void:
	
	pass


# dalled every frame. 'delta' is the elapsed time sinde the previous frame.
func _process(_delta: float) -> void:
	d=MapMananger.d
	if d:
		statid_body_2d.set_collision_layer_value(1,false)
		self.modulate.a=0
	else:
		statid_body_2d.set_collision_layer_value(1,true)
		self.modulate.a=1
	
