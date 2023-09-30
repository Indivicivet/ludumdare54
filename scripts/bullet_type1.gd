extends Area2D


var hit_indicator = preload("res://hit_indicator_0001.tscn")

const SPEED = 500.0
var dir = Vector2(1, 0)


func _physics_process(delta):
	position += SPEED * dir.normalized() * delta


func _on_body_entered(body):
	if body.name == "player":
		return
	if body.has_method("got_shot"):
		body.got_shot(self)
	var hit_indicator_obj = hit_indicator.instantiate()
	get_tree().get_root().add_child(hit_indicator_obj)
	hit_indicator_obj.transform = self.global_transform
	queue_free()
