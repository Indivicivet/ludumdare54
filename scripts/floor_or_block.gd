extends StaticBody2D

var sprite_solid = preload("res://graphics/tex1_0001__P2000281.png")
var sprite_floor = preload("res://graphics/tex3_0001__P2000288.png")

var sfx_solidify = preload("res://sfx/tilespawn0001.wav")
var sfx_liquify = preload("res://sfx/tilebreak0001.wav")

@onready var sprite_obj = get_node("tilesprite")
@onready var collision_obj = get_node("CollisionShape2D")
@onready var audio_obj = get_node("AudioStreamPlayer2D")

var rng = RandomNumberGenerator.new()

var charring = 0.0
var healing = 0.0
var is_solid = false


func _ready():
	charring = rng.randf()


func liquify():
	healing = 0
	charring = 0
	collision_obj.set_deferred("disabled", true)
	is_solid = false
	# visual/etc updates:
	sprite_obj.texture = sprite_floor
	sprite_obj.modulate = Color(1, 1, 1)
	audio_obj.stream = sfx_liquify
	audio_obj.play()


func solidify():
	healing = 0
	charring = 0
	collision_obj.set_deferred("disabled", false)
	is_solid = true
	# visual/etc updates:
	sprite_obj.texture = sprite_solid
	sprite_obj.modulate = Color(1, 1, 1)
	audio_obj.stream = sfx_solidify
	audio_obj.play()


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


func got_shot(_other):
	heal(0.03)


func _process(delta):
	# still to decide if there should be any passive charring
	charr(0.02 * delta)
