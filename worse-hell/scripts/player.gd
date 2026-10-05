class_name playerController extends CharacterBody2D
##primarily does movement right now
@export_category("stats") 
@export var movespeed = 28


func _physics_process(delta: float) -> void:
	#gets direction from inputs, normalizes it, and applies movespeed to it
	var dir = Input.get_vector("left","right","forward","backward").normalized()
	velocity = dir * movespeed
	
	#actually applies movement
	move_and_slide()
