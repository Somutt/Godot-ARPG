extends MEF

func _ready() -> void:
	estados = {
		"idle": $Idle,
		"move": $Move,
		"attack": $Attack
	}
