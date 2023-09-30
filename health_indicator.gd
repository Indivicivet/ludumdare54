extends Node2D


func _process(delta):
	get_node("Sprite2D").set_region_rect(Rect2(
		0, 0,
		500 * owner.get_node("player/player_health").health,
		50,
	))
