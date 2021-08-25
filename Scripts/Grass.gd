extends Node2D


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		var GrassEffect = load("res://Scenes/GrassEffect.tscn")
		var grass_effect = GrassEffect.instance()
		get_parent().add_child(grass_effect)
		grass_effect.position = position
		
		queue_free()
