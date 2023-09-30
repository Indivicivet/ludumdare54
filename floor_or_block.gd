extends StaticBody2D

var sprite_solid = preload("res://graphics/tex1_0001__P2000281.png")
var sprite_floor = preload("res://graphics/tex3_0001__P2000288.png")

@onready var sprite_obj = get_node("tilesprite")
@onready var collision_obj = get_node("CollisionShape2D")

var rng = RandomNumberGenerator.new()

var charring = 0.0
var healing = 0.0
var is_solid = false


func liquify():
	healing = 0
	charring = 0
	sprite_obj.texture = sprite_floor
	sprite_obj.modulate = Color(1, 1, 1)
	collision_obj.set_deferred("disabled", true)
	is_solid = false


func solidify():
	healing = 0
	charring = 0
	sprite_obj.texture = sprite_solid
	sprite_obj.modulate = Color(1, 1, 1)
	collision_obj.set_deferred("disabled", false)
	is_solid = true


func heal(amt):
	if not is_solid:
		return
	healing += amt
	var col = 1 + healing
	sprite_obj.modulate = Color(col, col, col)
	if healing > 1:
		liquify()


func charr(amt):
	if is_solid:
		return
	charring += amt
	var col = 2 - charring
	sprite_obj.modulate = Color(col, col, col)
	if charring > 1:
		solidify()


func got_shot(other):
	heal(0.1)


func _ready():
	charring = rng.randf()


func _process(delta):
	# print(charring)
	charr(0.1 * delta)
