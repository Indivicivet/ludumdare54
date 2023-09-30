extends Area2D


const SPEED = 500.0
var dir = Vector2(1, 0)


func _physics_process(delta):
	position += SPEED * dir.normalized() * delta


func _on_body_entered(body):
	if body.has_method("got_shot"):
		body.got_shot(self)
	if not body.name == "player":
		queue_free()
