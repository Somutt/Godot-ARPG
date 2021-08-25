extends KinematicBody2D

#Esse chefe pode ser testado se sua cena for rodada separadamente com F6
#Ativar os collisions_shape no Debug permite ver a animação do ataque especial
onready var player_detection_zone = $PlayerDetectionZone
onready var animations_count = 0
onready var attack_input_count = 0

func _ready() -> void:
	return
