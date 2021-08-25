extends Estado

func enter():
	owner.get_node("BossAnimationPlayer").play("arrive")

func update(delta):
	if owner.get_node("BossAnimationPlayer").is_playing():
		return
	else:
		emit_signal("finished", "idle")
