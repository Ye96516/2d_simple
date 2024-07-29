extends Sprite2D
@export var b:bool
@onready var static_body_2d: StaticBody2D = $StaticBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



func _process(_delta: float) -> void:
	b=MapMananger.b
	if b:
		static_body_2d.set_collision_layer_value(1,false)
		self.modulate.a=0
	else:
		static_body_2d.set_collision_layer_value(1,true)
		self.modulate.a=1
	
