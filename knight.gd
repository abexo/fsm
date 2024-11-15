class_name Knight
extends CharacterBody2D

@export var max_speed = 40

func _ready():
	pass	
	
func _physics_process(delta: float) -> void:
 	
	velocity = Input.get_vector("move_left","move_right","move_up","move_down") * max_speed
	move_and_slide()
