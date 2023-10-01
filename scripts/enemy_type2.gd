extends CharacterBody2D


const SPEED = 50  # CHANGED VS TYPE 1

var target_pos = Vector2(0, 0)
var hp = 1


@onready var navigation_agent = get_node("NavigationAgent2D")
@onready var sprite_obj = get_node("Sprite2D")
@onready var root = get_tree().get_root().get_node("game_root")
@onready var player = root.get_node("play_region/player")
@onready var score = root.get_node("score")


func _ready():
	sprite_obj.modulate = Color(1, 1, 1)
	navigation_agent.path_desired_distance = 1.0
	navigation_agent.target_desired_distance = 1.0
	call_deferred("pathfinding_setup")


func got_shot(_other):
	hp -= 0.015  # CHANGED VS TYPE 1
	sprite_obj.modulate = Color(2 - hp, 2 - hp, 2 - hp)  # CHANGED VS TYPE 1
	if hp < 0:
		score.score += 1
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
	for i in get_slide_collision_count():
		var collider = get_slide_collision(i).get_collider()
		if collider.name == "player":
			collider.touched_by_enemy(self, delta)
