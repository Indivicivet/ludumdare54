extends StaticBody2D

var sprite_solid = preload("res://graphics/tex1_0001__P2000281.png")
var sprite_floor = preload("res://graphics/tex3_0001__P2000288.png")

var rng = RandomNumberGenerator.new()

var charring = 0.0


func solidify():
	get_node("tilesprite").texture = sprite_solid
	get_node("CollisionShape2D").disabled = false


func _ready():
	charring = rng.randf()


func _process(delta):
	# print(charring)
	charring += 0.1 * delta
	if charring > 1:
		solidify()
