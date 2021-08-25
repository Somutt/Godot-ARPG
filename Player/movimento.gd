extends Estado
class_name Movimento

#Esse estado e necessario porque ambos estados "idle" e "move" precisam ter acesso a mesma direcao para se mesclarem
#Alem disso, essa direcao deve ser atualizada todo frame, mas o jogador nao tera um _physics_process, entao cabera
#aos updates de "idle" e "move" atualizarem a variavel direcao captada pelo input
func get_direction():
	var direction = Vector2()
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	direction = direction.normalized()
	return direction

#O jogador tambem precisa ter acesso a direcao atual para trabalhar a animacao no _processs
func update_owner_direction(direction):
	if direction != owner.direction:
		owner.direction = direction
	return
