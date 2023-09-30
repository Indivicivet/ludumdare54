extends StaticBody2D

var sprite_solid = preload("res://graphics/tex1_0001__P2000281.png")
var sprite_floor = preload("res://graphics/tex3_0001__P2000288.png")

var rng = RandomNumberGenerator.new()


func solidify():
	get_node("tilesprite").texture = sprite_solid
	get_node("CollisionShape2D").disabled = false


func _ready():
	if rng.randf() < 0.2:
		solidify()
