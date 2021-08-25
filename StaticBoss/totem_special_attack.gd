extends Estado

#O ataque especial é atualizado pela animação no editor
func enter():
	owner.get_node("BossAnimationPlayer").play("special_attack")

func update(delta):
	if owner.get_node("BossAnimationPlayer").is_playing():
		return
	else:
		emit_signal("finished", "idle")
