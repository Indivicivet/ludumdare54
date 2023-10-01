extends Node2D


const RANDOM_SPREAD = 0.25;

var rng = RandomNumberGenerator.new()
var bullet_type_1 = preload("res://bullet_type_1.tscn")

const FIRE_DELAY = 0.03  # probs every frame if fast enough :))
var fire_next_delay = 0


func fire_bullet():
	var bullet_inst = bullet_type_1.instantiate()
	owner.add_child(bullet_inst)
	owner.move_child(bullet_inst, 3)
	bullet_inst.global_transform = self.global_transform
	var target_dir = (
		get_local_mouse_position()
		- self.transform.get_origin()
	)
	bullet_inst.dir = (
		target_dir
		+ Vector2(
			rng.randf_range(-1, 1), rng.randf_range(-1, 1)
		) * target_dir.abs() * RANDOM_SPREAD / 2
	)


func _process(delta):
	fire_next_delay -= delta
	if Input.is_action_pressed("primary_fire"):
		if fire_next_delay <= 0:
			fire_bullet()
			fire_next_delay = FIRE_DELAY
		
		
