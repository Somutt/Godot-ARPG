extends Estado

#Por enquanto, apenas animacao
func enter():
	owner.get_node("BossAnimationPlayer").play("ranged_attack")

func update(delta) -> void:
	if owner.get_node("BossAnimationPlayer").is_playing():
		return
	else:
		emit_signal("finished", "idle")
