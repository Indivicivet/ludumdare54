extends Node2D


@onready var play_region = preload("res://play_region.tscn")


func _process(_delta):
	if Input.is_action_pressed("quit"):
		get_tree().quit()
		return
	if Input.is_action_just_pressed("mute"):
		var bgm = get_node("bgm")
		if bgm.playing:
			bgm.stop()
		else:
			bgm.play()
	if Input.is_action_just_pressed("restart"):
		var pos = get_node("play_region").transform.get_origin();
		get_node("play_region").free()
		var inst = play_region.instantiate()
		add_child(inst)
		inst.set_name("play_region")
		inst.transform.origin = pos;
		# and reset score...
		get_node("score").score = 0
