extends StaticBody2D

var sprite_solid = preload("res://graphics/tex1_0001__P2000281.png")
var sprite_floor = preload("res://graphics/tex3_0001__P2000288.png")

@onready var sprite_obj = get_node("tilesprite")
@onready var collision_obj = get_node("CollisionShape2D")

var rng = RandomNumberGenerator.new()

var charring = 0.0
var healing = 0.0


func liquify():
	healing = 0
	charring = 0
	sprite_obj.texture = sprite_floor
	collision_obj.set_deferred("disabled", true)


func solidify():
	healing = 0
	charring = 0
	sprite_obj.texture = sprite_solid
	collision_obj.set_deferred("disabled", false)


func got_shot(other):
	healing += 0.1
	if healing > 1:
		liquify()


func _ready():
	charring = rng.randf()


func _process(delta):
	# print(charring)
	charring += 0.1 * delta
	if charring > 1:
		solidify()
