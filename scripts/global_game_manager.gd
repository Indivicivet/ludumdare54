extends Node2D


func _process(_delta):
	if Input.is_action_pressed("quit"):
		get_tree().quit()
