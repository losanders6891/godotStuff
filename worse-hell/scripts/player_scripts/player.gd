class_name playerController extends CharacterBody2D
##primarily does movement right now
@export_category("camera")
@export var camera_zoom_y = 1.0
@export var camera_zoom_x = 1.0
@export_category("overworld stats") 
@export var movespeed = 28
@export var acceleration = 8
@export var deceleration = 2

@onready var camera: Camera2D = $Camera2D
func _ready() -> void:
	camera.zoom = Vector2(camera_zoom_x,camera_zoom_y)


func _physics_process(delta: float) -> void:
	
	#gets direction from inputs, normalizes it, and applies movespeed to it
	var dir = Input.get_vector("left","right","forward","backward").normalized()
	if dir:
		velocity = velocity.move_toward(dir * movespeed, acceleration)

	else:
		velocity = velocity.move_toward(Vector2(0,0), deceleration)
	#actually applies movement
	move_and_slide()
