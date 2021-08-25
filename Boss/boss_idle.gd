extends Estado

#Pega lista de estados que nao dependem de nada para serem transicionados
const ATTACK_STATES = ["dash_attack", "ranged_attack"]

func enter():
	owner.get_node("BossAnimationPlayer").play("idle")
	var player_detection = owner.player_detection_zone.can_see_player() #detecta o jogador
	owner.animations_count = 0 #Zera o contador de animacoes do boss

func _ready() -> void:
	randomize()

func update(delta):
	var player = owner.player_detection_zone.player
	var idle_animation_count = owner.animations_count
	if player != null:
		#Captura a posição do jogador p/, caso ele esteja em certo limite, usar o ataque de círculo, no futuro, pretendo deixar toda essa lógica mais "fuzzy"
		var position_x = player.position.x - owner.position.x
		var position_y = player.position.y - owner.position.y
		if position_x < 50 and position_x > -50 and position_y < 50 and position_y > -50 and idle_animation_count > 1:
			emit_signal("finished", "circle_attack")
		#Escolhe a próxima animação que não dependa de distância, no futuro, pretendo deixar mais complexo, mas no momento. é 50/50, também pretendo acrescentar um movimento normal
		elif idle_animation_count > 1:
			emit_signal("finished", get_next_attack())

#Soma o contador de animação, necessário p/ transicionar, é preciso um método poque essa função
#É chamada no fim da animação pelo AnimationPlayer
func idle_count():
	owner.animations_count += 1

#Seleciona randomicamente o proximo estado que independe de distância
func get_next_attack():
	var next_attack = ATTACK_STATES[randi()%ATTACK_STATES.size()]
	return next_attack
