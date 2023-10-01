extends Node2D


var rng = RandomNumberGenerator.new()

var enemy_type1_scn = preload("res://enemy_type_1.tscn")
var enemy_type2_scn = preload("res://enemy_type_2.tscn")


func _on_timer_timeout():
	var enemy_obj = (
		enemy_type1_scn.instantiate()
		if rng.randf() < 0.75
		else enemy_type2_scn.instantiate()
	)
	add_child(enemy_obj)
	enemy_obj.transform = Transform2D.IDENTITY
	get_node("AudioStreamPlayer2D").play()
