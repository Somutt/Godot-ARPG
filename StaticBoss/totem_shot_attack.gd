extends Estado

#Por enquanto, apenas animação
func enter():
	owner.get_node("BossAnimationPlayer").play("attack")

func update(delta) -> void:
	if owner.get_node("BossAnimationPlayer").is_playing():
		return
	else:
		emit_signal("finished", "idle")
