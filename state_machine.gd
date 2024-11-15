class_name StateMachine
extends Node

# The current_state: represents the current state. 
# It uses @export to assign the initial state from the editor.
@export var current_state: State

# States is a dictionary containing all the child nodes 
# (states) indexed by their name.
var states: Dictionary = {}

# In the _ready function we initialize states, we connect 
# the machine to each transitioned signal, and we start the
# execution of the initial state.
func _ready():
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.transitioned.connect(on_child_transitioned)
		else:
			push_warning("State machine contains child which is not 'State'")
			
	# Ensure the current_state is valid before calling Enter()
	if current_state != null:
		current_state.Enter()
	else:
		push_warning("Current state is not set!")

# The following two are responsible to call Update and Physics_update 
# for the current state:.	
func _process(delta):
	current_state.Update(delta)
		
func _physics_process(delta):
	current_state.Physics_update(delta)

# The on_child_transitioned function gets the name of the next 
# state and executes the transition from the current state 
# (calling Exit) to the new state (calling Enter).
func on_child_transitioned(new_state_name: StringName) -> void:
	var new_state = states.get(new_state_name)
	if new_state != null:
		if new_state != current_state:
			current_state.Exit()
			new_state.Enter()
			current_state = new_state
	else:
		push_warning("Called transition on a state that does not exist")
