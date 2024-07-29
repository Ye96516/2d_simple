extends StateBase


@export var speed:int=15000
@export var jump_speed:int=-22000

const JUMP = preload("res://art/audio/jump.wav")
const jump=preload("res://art/audio/弹跳_干脆可爱.mp3")

var time:float
var ciShu:int

func enter():
	super.enter()
	#print("跳跃")
	Audio.play(jump)
	ans.play("jump")

func physical_process_update(delta:float):
	ciShu+=1
	super.physical_process_update(delta)
	if ciShu==1:
		player.velocity.y=jump_speed*delta
	
#不能将一下判断放在process_update(delta:float)，因为此时玩家的y轴速度很可能还没有加上
	if player.is_on_floor() and player.velocity.y==0:
		state_machine.change_state("idle")
	
	if player.direction !=0:
		state_machine.change_state("run")
	
	if player.is_die:
		state_machine.change_state("die")
	
	
		
func exit():
	ciShu=0
	

	

