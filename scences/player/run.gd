extends StateBase


@export var speed = 15000
@onready var collision_shape_2d: CollisionShape2D = $"../../CollisionShape2D"

func enter():
	super.enter()
	#print("进入运动")
	ans.play("run")
	
func physical_process_update(delta: float):
	super.physical_process_update(delta)
	
	if player.direction==1:
		ans.flip_h=false
		collision_shape_2d.position=Vector2(5.333,0.333)
	if player.direction==-1:
		ans.flip_h=true
		collision_shape_2d.position=Vector2(0.667,0.333)
	
	move(delta)

func process_update(delta: float):
	if player.direction == 0:
		state_machine.change_state("idle")

	if Input.is_action_just_pressed("k") and player.is_on_floor():
		state_machine.change_state("jump")
		
	if player.is_die:
		state_machine.change_state("die")
func move(de):
	player.velocity.x = player.direction * speed*de

