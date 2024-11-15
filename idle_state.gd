class_name IdleState
extends State

@export var actor: CharacterBody2D
@export var animator: AnimatedSprite2D

var movement_keys = ["move_up", "move_left", "move_down", "move_right"]

func Enter():
	set_process(true)  # Start processing in the state
	animator.play("idle")  # Play the idle animation

func Update(delta):
	for key in movement_keys:
		if Input.is_action_just_pressed(key):
			transitioned.emit("MoveState")  # Transition to MoveState on input

func Exit():
	set_process(false)  # Stop processing when exiting the state
