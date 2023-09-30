extends StaticBody2D

var sprite_solid = preload("res://graphics/tex1_0001__P2000281.png")
var sprite_floor = preload("res://graphics/tex3_0001__P2000288.png")

var rng = RandomNumberGenerator.new()

var charring = 0.0
var healing = 0.0


func liquify():
	get_node("tilesprite").texture = sprite_floor
	get_node("CollisionShape2D").set_deferred("disabled", true)


func solidify():
	get_node("tilesprite").texture = sprite_solid
	get_node("CollisionShape2D").set_deferred("disabled", false)


func got_shot(other):
	healing += 0.1
	if healing > 1:
		healing = 0
		charring = 0
		liquify()


func _ready():
	charring = rng.randf()


func _process(delta):
	# print(charring)
	charring += 0.1 * delta
	if charring > 1:
		solidify()
