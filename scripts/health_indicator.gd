extends Node2D


func _process(_delta):
	get_node("Sprite2D").set_region_rect(Rect2(
		0, 0,
		400 * owner.get_node("play_region/player").health,
		50,
	))
