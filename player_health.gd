extends Node2D


var health = 1.0

func _process(delta):
	health -= 0.1 * delta
