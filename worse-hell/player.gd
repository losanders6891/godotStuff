class_name playerController extends CharacterBody3D
var movespeed = 18

func _physics_process(delta: float) -> void:
	var dir = Input.get_vector("left","backward","forward","right")
	velocity = dir * movespeed
	move_and_slide()
