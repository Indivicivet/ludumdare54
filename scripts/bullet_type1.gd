extends Area2D


var hitsound = preload("res://sfx/hitHurt0001.wav")

@onready var audiostream_obj = get_tree().get_root().get_node("game_root").get_node("AudioStreamPlayer2D")


const SPEED = 500.0
var dir = Vector2(1, 0)


func _physics_process(delta):
	position += SPEED * dir.normalized() * delta


func _on_body_entered(body):
	if body.has_method("got_shot"):
		audiostream_obj.stream = hitsound
		audiostream_obj.play()
		body.got_shot(self)
	if not body.name == "player":
		queue_free()
