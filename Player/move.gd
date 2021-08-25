extends Movimento

onready var speed = owner.MAX_SPEED

var velocity = Vector2()

func enter():
	var direction = get_direction()
	update_owner_direction(direction)

func update(delta):
	var direction = get_direction()
	update_owner_direction(direction)
	if direction == Vector2.ZERO:
		emit_signal("finished", "idle")
	
	move(speed, direction)

func move(speed, direction):
	#print(direction)
	velocity = direction * speed
	owner.move_and_slide(velocity)
	return
