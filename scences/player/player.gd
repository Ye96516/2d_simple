extends CharacterBody2D

const JUMP = preload("res://art/audio/弹跳_干脆可爱.mp3")
const JUMP1 = preload("res://art/audio/jump.wav")
const SHORT_BOMB = preload("res://art/audio/short_bomb.mp3")

@export var speed = 300.0
@export var jump_velocity = -350.0
@export var buChang:float=121
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

enum stat{idle,jump,run,die}
var state=stat.idle
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_die:bool
var die_count:int=1

func _ready() -> void:
	#Engine.time_scale=0.1
	set_physics_process(true)
	
func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("k") and is_on_floor():
		Audio.play(JUMP,true,true,0)
		state=stat.jump
	
	if Input.is_action_just_pressed("a")or Input.is_action_just_pressed("d"):
		state=stat.run
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	

	move_and_slide()
func _process(delta: float) -> void:

	if is_die:
		state=stat.die
	match state:
		stat.idle:
			idle()
			#print("idle")
		stat.run:
			run(delta)
			#print("run")
		stat.jump:
			
			jump(delta)
			#print("jump")
		stat.die:
			die()
			#print("die")
	
	
func idle():
	animated_sprite_2d.speed_scale=1
	animated_sprite_2d.play("idle")
	velocity.x = move_toward(velocity.x, 0, speed)
	
func jump(de):
	animated_sprite_2d.speed_scale=12
	animated_sprite_2d.play("jump")
	velocity.y = jump_velocity*de*buChang
	await animated_sprite_2d.animation_finished
	animated_sprite_2d.speed_scale=1
	state=stat.run

func die():
	die_count+=1
	if die_count==2:
		Audio.play(SHORT_BOMB,true,true,0)
	animated_sprite_2d.speed_scale=1
	animated_sprite_2d.play("die")
	await animated_sprite_2d.animation_finished
	if get_tree() !=null:
		get_tree().reload_current_scene()
	

func run(de):
	animated_sprite_2d.speed_scale=1
	animated_sprite_2d.play("run")
	var direction := Input.get_axis("a", "d")
	if direction:
		velocity.x = direction * speed*de*buChang
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		state=stat.idle
	if direction==-1:
		animated_sprite_2d.flip_h=true
		collision_shape_2d.position=Vector2(0.333,0.333)
	elif direction==1:
		animated_sprite_2d.flip_h=false
		collision_shape_2d.position=Vector2(5.333,0.333)
	
	
