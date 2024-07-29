extends Node

@onready var spikes_2: Node2D = $"../spikes2"
@onready var spikes: Node2D = $"../spikes"
@onready var spikes_3: Node2D = $"../spikes3"
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
const DOWNTEMPO= preload("res://art/audio/bg/Downtempo未来的寒风.mp3")
func _ready() -> void:
	#print("进入场景五")
	Audio.play(DOWNTEMPO,true,false,-7)
	spikes.position=Vector2(0,14)
	
	var t=create_tween()
	t.set_loops()
	t.set_trans(Tween.TRANS_ELASTIC)
	t.tween_property(spikes_2,"position",Vector2(1685,-88),3)
	t.tween_property(spikes_2,"position",Vector2(5,-88),3)
	
	var tw=create_tween()
	tw.set_loops()
	tw.set_trans(Tween.TRANS_QUINT)
	tw.tween_property(spikes_3,"position",Vector2(5,-299),3)
	tw.tween_property(spikes_3,"position",Vector2(1685,-299),3)
	
func _on_detecter_body_entered(body: Node2D) -> void:
	body.velocity.y=0
	body.gravity=0
	body.position=Vector2(body.position.x,0)
	body.gravity=500
	



func _on_detecter_2_body_entered(_body: Node2D) -> void:
	animation_player.play("dong")
