extends Node2D


var score = 0


func _process(_delta):
	get_node("RichTextLabel").text = "Score: " + str(score)
