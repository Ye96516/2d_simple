extends Sprite2D
@export var a:bool
@onready var static_body_2d: StaticBody2D =$map

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	a=MapMananger.a


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if a:
		static_body_2d.set_collision_layer_value(1,false)
		self.modulate.a=0
	else:
		static_body_2d.set_collision_layer_value(1,true)
		self.modulate.a=1

