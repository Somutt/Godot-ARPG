extends Entity

var direction: = VZERO

func _physics_process(_delta: float) -> void:
	direction = set_direction()
	
	velocity = move_velocity(velocity, ACCELERATION, MAX_SPEED, FRICTION)
	
	velocity = move_and_slide(velocity)

func _process(_delta: float) -> void:
	player_run_animation()

func set_direction() -> Vector2:
	var dir: = Vector2()
	dir.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	dir.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	dir = dir.normalized()
	return dir

func move_velocity(velocity: Vector2, acceleration: int, max_speed: int, friction: int) -> Vector2:
	var new_vel: = velocity
	if direction != VZERO:
		new_vel = new_vel.move_toward(direction * max_speed, acceleration).ceil()
	else:
		new_vel = new_vel.move_toward(VZERO, friction).floor()
	return new_vel

func player_run_animation() -> void:
	if direction != VZERO:
		animation_tree.set("parameters/Idle/blend_position", direction)
		animation_tree.set("parameters/Run/blend_position", direction)
		animation_state.travel("Run")
	else:
		animation_state.travel("Idle")
	return
