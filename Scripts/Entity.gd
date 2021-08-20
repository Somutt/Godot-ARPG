extends KinematicBody2D
class_name Entity

onready var animation_player = $AnimationPlayer
onready var animation_tree = $AnimationTree
onready var animation_state = animation_tree.get("parameters/playback")

const VZERO = Vector2.ZERO

export var MAX_SPEED: = 100
export var ACCELERATION: = 15
export var FRICTION = 5

var velocity: = VZERO

func _physics_process(_delta: float) -> void:
	return

func _process(_delta: float) -> void:
	return
