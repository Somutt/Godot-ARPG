extends Node
class_name Estado
#Script base para os estados da maquina de estados

#Emite o sinal "finished" para indicar que a ação daquele estado acabou
signal finished(proximo_estado)

#funcao que sera chamada quando o estado for iniciado
func enter():
	return

#funcao que sera chamada quando o estado for mudado
func exit():
	return

#essa funcao e respossavel por processar o input do jogador
func handle_input(evento):
	return

#funcao que sera chamada para atualizar o processo de fisica
func update(delta):
	return
