class_name Knight
extends CharacterBody2D

@export var max_speed = 80.0

func _ready():
	pass	
	
func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO

	# Check input for movement directions
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1

	# Normalize direction to prevent faster diagonal movement
	direction = direction.normalized()

	# Set velocity directly to the desired speed in the direction
	velocity = direction * max_speed

	# Move the character based on the internal velocity
	move_and_slide() 
