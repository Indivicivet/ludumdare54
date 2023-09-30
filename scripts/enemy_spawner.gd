extends Node2D


var enemy_type1_scn = preload("res://enemy_type_1.tscn")


func _on_timer_timeout():
	var enemy_obj = enemy_type1_scn.instantiate()
	add_child(enemy_obj)
	enemy_obj.transform = Transform2D.IDENTITY
