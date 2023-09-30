extends Node2D


const SPEED = 15.0;
const WIDTH = 2592;
const HEIGHT = 1944;

var dir_cos = 0.7;
var dir_sin = (1 - dir_cos ** 2) ** 0.5;


# Called when the node enters the scene tree for the first time.
func _ready():
	choose_direction()


func choose_direction():
	dir_cos = -0.7;
	dir_sin = (1 - dir_cos ** 2) ** 0.5;


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
