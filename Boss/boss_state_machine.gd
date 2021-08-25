extends MEF

func _ready() -> void:
	estados = {
		"arrive": $Arrive,
		"idle": $Idle,
		"dash_attack": $DashAttack,
		"circle_attack": $CircleAttack,
		"ranged_attack": $RangedAttack
	}

