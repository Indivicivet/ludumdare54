extends Node2D


var bullet_type_1 = preload("res://bullet_type_1.tscn")


func _process(delta):
	if Input.is_action_pressed("primary_fire"):
		var bullet_inst = bullet_type_1.instantiate()
		owner.add_child(bullet_inst)
		bullet_inst.transform = self.global_transform
		var mouse_pos = get_viewport().get_mouse_position()
		var dir_x = mouse_pos.x - self.global_transform.get_origin().x
		var dir_y = mouse_pos.y - self.global_transform.get_origin().y
		bullet_inst.dir = Vector2(dir_x, dir_y)
