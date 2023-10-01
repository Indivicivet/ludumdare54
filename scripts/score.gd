extends Node2D


var score = 0


@onready var digits = get_node("digits")
@onready var tens = get_node("tens")
@onready var hundreds = get_node("hundreds")

@onready var font_digits = [
	preload("res://graphics/font/font0__P2000288.png"),
	preload("res://graphics/font/font1__P2000288.png"),
	preload("res://graphics/font/font2__P2000288.png"),
	preload("res://graphics/font/font3__P2000288.png"),
	preload("res://graphics/font/font4__P2000288.png"),
	preload("res://graphics/font/font5__P2000288.png"),
	preload("res://graphics/font/font6__P2000288.png"),
	preload("res://graphics/font/font7__P2000288.png"),
	preload("res://graphics/font/font8__P2000288.png"),
	preload("res://graphics/font/font9__P2000288.png"),
]


func _process(_delta):
	digits.texture = font_digits[score % 10]
	tens.texture = font_digits[floor(score / 10) % 10]
	hundreds.texture = font_digits[floor(score / 100) % 10]
