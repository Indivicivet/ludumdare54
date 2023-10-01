extends Timer


const EASY_TIME = 3
const HARD_TIME = 1.3

@onready var score = get_tree().get_root().get_node("game_root").get_node("score")


func _process(_delta):
	# would be much nicer to just update this when score changes
	# but it's a jam :) hacky n working
	wait_time = (
		EASY_TIME if score.score < 4
		else HARD_TIME  if score.score > 15
		else EASY_TIME - (score.score - 4) * (EASY_TIME - HARD_TIME) / (15 - 4)
	)
