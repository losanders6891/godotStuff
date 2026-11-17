class_name playerController extends CharacterBody2D
##primarily does movement right now
@export_category("camera")
@export var camera_zoom_y = 1.0
@export var camera_zoom_x = 1.0
@export_category("overworld stats") 
@export var movespeed = 28
@export var acceleration = 8
@export var deceleration = 2
var last_dir = Vector2.DOWN

@onready var animations = $AnimatedSprite2D
@onready var camera: Camera2D = $Camera2D
func _ready() -> void:
	camera.zoom = Vector2(camera_zoom_x,camera_zoom_y)
	if !self in get_tree().get_nodes_in_group("Persist"):
		add_to_group("Persist")
	if !self in get_tree().get_nodes_in_group("Player"):
		add_to_group("Player")
func _physics_process(_delta: float) -> void:
	
	#gets direction from inputs, normalizes it, and applies movespeed to it
	var dir = Input.get_vector("left","right","forward","backward").normalized()
	if dir:
		velocity = velocity.move_toward(dir * movespeed, acceleration)
	else:
		velocity = velocity.move_toward(Vector2(0,0), deceleration)
		dir = Vector2.ZERO
	updateAnimation(dir)
	
	#actually applies movement
	move_and_slide()

func updateAnimation(dir:Vector2):
	if dir != Vector2.ZERO:	
		last_dir = dir
		if abs(dir.x) > abs(dir.y):
			if dir.x > 0:
				animations.play("Walk right")
			else:
				animations.play("Walk left")
		else:
			if dir.y > 0:
				animations.play("Walk front")
			else:
				animations.play("Walk back")
	if dir == Vector2.ZERO:
		if abs(last_dir.x) > abs(last_dir.y):
			if last_dir.x > 0:
				animations.play("Idle right")
			else:
				animations.play("Idle left")
		else:
			if last_dir.y > 0:
				animations.play("Idle front")
			else:
				animations.play("Idle back")
		
func save():
	var save_dict = {
		"filename" : get_scene_file_path(),
		"path_in_scene" : get_path(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x, # Vector2 is not supported by JSON
		"pos_y" : position.y,
		
		#to simplify code
		#"is_alive" : true
		}
	return save_dict
