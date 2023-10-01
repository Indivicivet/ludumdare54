extends Node2D


const RANDOM_SPREAD = 3;

var rng = RandomNumberGenerator.new()
var bullet_type_1 = preload("res://bullet_type_1.tscn")


func _process(_delta):
	if Input.is_action_pressed("primary_fire"):
		var bullet_inst = bullet_type_1.instantiate()
		owner.add_child(bullet_inst)
		bullet_inst.global_transform = self.global_transform
		bullet_inst.dir = (
			get_local_mouse_position()
			- self.transform.get_origin()
			+ Vector2(
				rng.randf_range(-1, 1), rng.randf_range(-1, 1)
			) * RANDOM_SPREAD / 2
		)
