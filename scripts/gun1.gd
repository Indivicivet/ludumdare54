extends Node2D


var bullet_type_1 = preload("res://bullet_type_1.tscn")


func _process(delta):
	if Input.is_action_pressed("primary_fire"):
		var bullet_inst = bullet_type_1.instantiate()
		owner.add_child(bullet_inst)
		bullet_inst.transform = self.global_transform
		bullet_inst.dir = (
			get_viewport().get_mouse_position()
			- self.global_transform.get_origin()
		)
