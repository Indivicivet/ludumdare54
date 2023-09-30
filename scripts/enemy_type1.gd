extends CharacterBody2D


const SPEED = 100

var target_pos = Vector2(0, 0)
var hp = 1


@onready var navigation_agent = get_node("NavigationAgent2D")
@onready var sprite_obj = get_node("Sprite2D")
@onready var player = get_tree().get_root().get_node("game_root").get_node("player")


func _ready():
	navigation_agent.path_desired_distance = 1.0
	navigation_agent.target_desired_distance = 1.0
	call_deferred("pathfinding_setup")


func got_shot(other):
	hp -= 0.02
	sprite_obj.modulate = Color(hp / 2, hp / 2, hp / 2)
	if hp < 0:
		queue_free()


func pathfinding_setup():
	await get_tree().physics_frame
	navigation_agent.target_position = target_pos


func _physics_process(delta):
	navigation_agent.target_position = player.global_position
	if navigation_agent.is_navigation_finished():
		return

	velocity = (
		navigation_agent.get_next_path_position() - global_position
	).normalized() * SPEED
	move_and_slide()
