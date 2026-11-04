class_name EnemyOverworld extends CharacterBody2D

@export_category("battle stats")
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@export var offsetOfCollider:int = 10
@export var health:int = 10
@export var damage:int = 1
var is_alive = true
var speed:int = 20
var direction:int = 1
var seePlayer:bool = false
var player = null

##if you can't figure out what this is asking for, then just ask me.
@export var battle_Scene:PackedScene
		
func _process(delta: float) -> void:
	if get_parent() is PathFollow2D:
		speed = 20
		get_parent().progress += speed * delta
	else: 
		if !is_alive:
			queue_free()
	
func _physics_process(delta: float) -> void:
	if not get_parent() is PathFollow2D:
		if seePlayer and player != null:
			#position += (player.position - position)/speed
			var Endir = global_position.direction_to(player.global_position)
			velocity = Endir * speed
		else:
			velocity = Vector2.ZERO
		move_and_slide()
		
func _on_detect_area_body_entered(body: Node2D) -> void:
	player = body
	seePlayer = true

func _on_detect_area_body_exited(body: Node2D) -> void:
	player = null
	seePlayer = false
	


func save():
	var save_dict = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x, # Vector2 is not supported by JSON
		"pos_y" : position.y,
		"is_alive" : is_alive
		}
	return save_dict
