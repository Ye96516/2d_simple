extends StateBase

func enter():
	super.enter()
	Audio.play(preload("res://art/audio/short_bomb.mp3"))
	ans.play("die")
	ans.animation_finished.connect(ans_finished)
	

func ans_finished():
	if get_tree():
		get_tree().reload_current_scene()
