extends Sprite2D


var rng = RandomNumberGenerator.new()


func _ready():
	set_region_rect(Rect2(
		rng.randi_range(0, 2000),
		rng.randi_range(0, 1000),
		64, 64
	))
