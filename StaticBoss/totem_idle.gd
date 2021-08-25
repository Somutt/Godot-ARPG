extends Estado

const ATTACK_STATES = ["ground_attack", "shot_attack"]

func enter():
	owner.get_node("BossAnimationPlayer").play("idle")
	var player_detection = owner.player_detection_zone.can_see_player()
	owner.animations_count = 0

func update(delta):
	var player = owner.player_detection_zone.player
	var idle_animation_count = owner.animations_count
	if Input.is_action_just_pressed("attack"):
		owner.attack_input_count += 1
	#No futuro, a transição dependerá dos ataques sofridos, como ainda não há hitbox, apenas apertar o input de ataque da trigger no special
	if owner.attack_input_count >= 3:
		emit_signal("finished", "special_attack")
		owner.attack_input_count = 0
	elif idle_animation_count > 2:
		emit_signal("finished", get_next_attack())

func idle_count():
	owner.animations_count += 1
	return owner.animations_count

func get_next_attack():
	var next_attack = ATTACK_STATES[randi()%ATTACK_STATES.size()]
	return next_attack
