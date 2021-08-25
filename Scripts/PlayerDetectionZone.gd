extends Area2D

var player = null

#Retorna se o player e igual ou nao a null, se nao for, retorna true, se for, retorna false
func can_see_player():
	return player != null

func _on_PlayerDetectionZone_body_entered(body: Node) -> void:
	player = body

func _on_PlayerDetectionZone_body_exited(body: Node) -> void:
	player = null
