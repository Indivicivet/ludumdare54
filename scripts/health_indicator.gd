extends Node2D


func _process(_delta):
	var bar_size = owner.get_node("play_region/player").health * 400
	get_node("Sprite2D").set_region_rect(Rect2(
		0, 0,
		bar_size,
		50,
	))
	get_node("Sprite2D").position.x = bar_size / 2 - 200
