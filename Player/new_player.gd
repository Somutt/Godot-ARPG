extends KinematicBody2D

onready var animation_tree = $AnimationTree
onready var animation_state = animation_tree.get("parameters/playback")

var direction = Vector2(1, 0)

export var MAX_SPEED = 150
export var ACCELERATION = 15
export var FRICTION = 5

func _ready():
	animation_tree.active = true

func _process(delta):
	player_animation(direction)

func player_animation(direction):
	if direction != Vector2.ZERO:
		animation_tree.set("parameters/Idle/blend_position", direction)
		animation_tree.set("parameters/Run/blend_position", direction)
		animation_tree.set("parameters/Attack/blend_position", direction)
		animation_state.travel("Run")
	else:
		animation_state.travel("Idle")
