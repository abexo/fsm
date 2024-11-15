class_name MoveState
extends State

@export var actor: CharacterBody2D
@export var animator: AnimatedSprite2D

func Enter():
	set_process(true)  # Start processing in the state
	animator.play("move")  # Start the move animation

func Update(delta):
	if actor.velocity == Vector2.ZERO:
		transitioned.emit("IdleState")  # Transition to IdleState if not moving

func Exit():
	set_process(false)  # Stop processing when exiting the state
