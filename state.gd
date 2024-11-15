# A State contains the following methods.
class_name State 
extends Node

# A signal that triggers a state change. This signal accepts 
# the name of the next state as parameter. The state machine 
# will react to the signal to update the current state.
signal transitioned(new_state_name: StringName)

# Execute some logic when the machine enters the state 
# (initialize variables, trigger one-time actions, update 
# current animation).
func Enter() -> void: 
	pass

# Execute some logic when the machine exists the state 
# (clean up resources, reset variables, remove nodes).
func Exit() -> void:
	pass

# Execute some logic at every frame (equivalent to _process).
func Update(delta: float) -> void:
	pass

# Execute some logic at fixed intervals (equivalent to _physics_process).
func Physics_update(delta: float) -> void:
	pass

# Each State also has a signal that triggers a state change. 
# This signal accepts the name of the next state as parameter. 
# The state machine will react to the signal to update the current state.
