extends Sprite2D
@export var c:bool
@onready var static_body_2d: StaticBody2D = $StaticBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	c=MapMananger.c
	if c:
		static_body_2d.set_collision_layer_value(1,false)
		self.modulate.a=0
	else:
		static_body_2d.set_collision_layer_value(1,true)
		self.modulate.a=1
