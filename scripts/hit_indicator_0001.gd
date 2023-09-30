extends Node2D


var rng = RandomNumberGenerator.new()


func _ready():
	transform.origin += Vector2(rng.randf_range(-3, 3), rng.randf_range(-3, 3))


func _on_timer_timeout():
	queue_free()
