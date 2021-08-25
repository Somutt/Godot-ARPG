extends Estado

func enter():
	owner.get_node("BossAnimationPlayer").play("dash_attack")
	owner.animations_count = 0
	var player = owner.player_detection_zone.player

func update(delta) -> void:
	var dash_animations_count = dash_count()
	dash_attack(delta)
	if owner.get_node("BossAnimationPlayer").is_playing():
		return
	else:
		emit_signal("finished", "idle")

func dash_attack(delta):
	var player = owner.player_detection_zone.player
	if player != null:
		var dash_distance = 0
		var dash_velocity = Vector2()
		var dash_direction = (player.position - owner.position).normalized()
		
		dash_velocity = dash_direction * 500
		dash_distance += dash_velocity.length() * delta
		
		owner.move_and_slide(dash_velocity)

#Pretendo fazer ele dar mais de um dash seguido e que ele nao pare no jogador, infelizmente ainda nao consegui
func dash_count():
	owner.animations_count += 1
	return owner.animations_count
