extends StateBase

func enter():
	super.enter()
	ans.play("idle")

func physical_process_update(delta: float):
	super.physical_process_update(delta)
	if player.direction != 0:
		state_machine.change_state("run")
		
func process_update(delta:float):
	super.process_update(delta)
	if player.is_die:
		state_machine.change_state("die")
	if Input.is_action_just_pressed("k") and player.is_on_floor():
		state_machine.change_state("jump")
