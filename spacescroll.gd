extends Node2D


const SPEED = 3.0;
const WIDTH = 2592;
const HEIGHT = 1944;
const RANDOM_CHANGE_AVERAGE_TIME = 10;

var rng = RandomNumberGenerator.new()
var dir_cos = 0.7;
var dir_sin = (1 - dir_cos ** 2) ** 0.5;


# Called when the node enters the scene tree for the first time.
func _ready():
	choose_direction()


func choose_direction():
	var x = rng.randf_range(-1, 1)
	var y = rng.randf_range(-1, 1)
	var r = (x ** 2 + y ** 2) ** 0.5
	dir_cos = x / r
	dir_sin = y / r


func _process(delta):
	self.position.x += SPEED * dir_cos;
	self.position.y += SPEED * dir_sin;
	if self.position.x > 0:
		self.position.x -= WIDTH;
	if self.position.x < -WIDTH:
		self.position.x += WIDTH;
	if self.position.y > 0:
		self.position.y -= HEIGHT;
	if self.position.y < -HEIGHT:
		self.position.y += HEIGHT;
	if rng.randf() < RANDOM_CHANGE_AVERAGE_TIME * delta:
		choose_direction()
