extends Movimento

func enter():
	var direction = get_direction()
	update_owner_direction(direction)

#O jogador estara apenas em idle se a direcao do movimento for 0 em ambos os sentidos, senao, ele ira para "move"
func update(delta):
	var direction = get_direction()
	if direction != Vector2.ZERO:
		emit_signal("finished", "move")
