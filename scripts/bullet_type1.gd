extends Area2D


const SPEED = 500.0
var dir_cos = 1.0
var dir_sin = 0.0


func _physics_process(delta):
	position.x += SPEED * dir_cos * delta
	position.y += SPEED * dir_sin * delta


func _on_body_entered(body):
	if body.has_method("got_shot"):
		body.got_shot(self)
	if not body.name == "player":
		queue_free()
