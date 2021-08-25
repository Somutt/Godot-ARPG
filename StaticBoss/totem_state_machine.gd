extends MEF


func _ready() -> void:
	estados = {
		"arrive": $Arrive,
		"idle": $Idle,
		"ground_attack": $GroundAttack,
		"shot_attack": $ShotAttack,
		"special_attack": $SpecialAttack
	}
