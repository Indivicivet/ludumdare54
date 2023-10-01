extends CharacterBody2D


const SPEED = 300.0

var health = 1.0


func _physics_process(_delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_x = Input.get_axis("left", "right")
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var direction_y = Input.get_axis("up", "down")
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()


func touched_by_enemy(_other, delta):
	health -= delta * 0.06
	if health < 0:
		health = 0
		die()


func die():
	set_process(false)
	set_physics_process(false)
	get_node("gun1").set_process(false)
	hide()
