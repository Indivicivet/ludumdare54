extends Area2D


const SPEED = 500
const DIR_COS = 1
const DIR_SIN = 0


func _physics_process(delta):
	position.x += SPEED * DIR_COS * delta
	position.y += SPEED * DIR_SIN * delta


func _on_body_entered(body):
	queue_free()
