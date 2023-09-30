extends Node2D


const SPEED = 200.0;
const WIDTH = 2592;
const HEIGHT = 1944;
const RANDOM_CHANGE_AVERAGE_TIME = 10;

var rng = RandomNumberGenerator.new()
var dir = Vector2(1, 0)


# Called when the node enters the scene tree for the first time.
func _ready():
	choose_direction()


func choose_direction():
	dir = Vector2(rng.randf_range(-1, 1), rng.randf_range(-1, 1))


func _process(delta):
	self.position += SPEED * dir.normalized() * delta;
	if self.position.x > 0:
		self.position.x -= WIDTH;
	if self.position.x < -WIDTH:
		self.position.x += WIDTH;
	if self.position.y > 0:
		self.position.y -= HEIGHT;
	if self.position.y < -HEIGHT:
		self.position.y += HEIGHT;
	if rng.randf() < delta / RANDOM_CHANGE_AVERAGE_TIME:
		choose_direction()
