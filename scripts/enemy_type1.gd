extends CharacterBody2D


const SPEED = 50

var target_pos = Vector2(0, 0)


@onready var navigation_agent = get_node("NavigationAgent2D")


func _ready():
	navigation_agent.path_desired_distance = 1.0
	navigation_agent.target_desired_distance = 1.0
	call_deferred("pathfinding_setup")


func pathfinding_setup():
	await get_tree().physics_frame
	navigation_agent.target_position = target_pos


func _physics_process(delta):
	if navigation_agent.is_navigation_finished():
		return

	velocity = (
		navigation_agent.get_next_path_position() - global_position
	).normalized() * SPEED
	move_and_slide()
