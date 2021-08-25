extends Node
class_name MEF
#Maquina de estados generica

#Sinal que indica que acabou de ocorrer uma mudanca de estado
signal state_changed(estado_atual)

#export e usado para que a cena que contem os estados passe seu estado inicial individualmente no editor, ele passara uma node e definira assim o estado inicial
export(NodePath) var ESTADO_INICIAL

#As maquinas de estado filhas desta maquina generica receberao uma lista de estados vazios
var estados = {}
#Inicializa uma pilha que armazena o(s) estado(s) atualmente em uso
var pilha_estados = []
#Armazena o estado atual da maquina
var estado_atual = null
#Variavel que indica se a maquina atual esta ativa ou nao. setget cria setters e/ou getters
var ativo = false setget set_ativo

func _ready() -> void:
	for child in get_children(): #Todos os nos filhos recebem o sinal "finished", conectando-o com o metodo "mudar_estado()"
		child.connect("finished", self, "mudar_estado")
	inicializar(ESTADO_INICIAL) #Inicializa a cena a partir do estado inicial passado no editor

#Inicializa a maquina de estado a partir de um estado inicial passado pela cena que contem os estados
func inicializar(estado_inicial):
	set_ativo(true)
	pilha_estados.push_front(get_node(estado_inicial)) #inicializa a pilha com o estado inicial
	estado_atual = pilha_estados[0] #o estado atual recebe a posicao 0 da pilha
	estado_atual.enter() #inicia o processo do estado
	return

#funcao criada para inicializar ou finalizar a atividade da maquina a partir do valor passado, ativando o processo de fisica e de inputs
func set_ativo(value):
	ativo = value
	set_physics_process(value) #Ativa o processo de fisica
	set_process_input(value) #Ativa a captacao de inputs
	if not ativo:
		pilha_estados = []
		estado_atual = null

func _input(evento):
	estado_atual.handle_input(evento)

func _physics_process(delta):
	estado_atual.update(delta)

func mudar_estado(nome_estado):
	if not ativo:
		return
	
	estado_atual.exit() #Realiza a acao de finalizacao do estado atual caso haja
	
	pilha_estados[0] = estados[nome_estado] #A primeira posicao da pilha recebe o estado passado
	
	estado_atual = pilha_estados[0] #Atualiza o estado atual
	emit_signal("state_changed", estado_atual) #Emite um sinal que o estado atual mudou para o atual
	
	estado_atual.enter() #Realiza a acao de entrada do estado atual
