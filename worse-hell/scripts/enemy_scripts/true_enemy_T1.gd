class_name EnemyOverworld extends CharacterBody2D

@export_category("battle stats")
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@export var offsetOfCollider:int = 10
@export var health:int = 10
@export var damage:int = 1
@export var ename:String = "w"
@export var roSpeed: float = 5.0
var is_alive = true
var speed:int = 20
var direction:int = 1
var seePlayer:bool = false
var player = null
##note: this is hard coded right now, you may have to manually change it
@export var battle_Scene:PackedScene = preload("res://scenes/battlescenes/battle.tscn")


func _ready() -> void:
	if !self in get_tree().get_nodes_in_group("Persist"):
		add_to_group("Persist")
	
	if seePlayer:
		position += (player.position - position)/speed
func _process(delta: float) -> void:
	if get_parent() is PathFollow2D:
		speed = 20
		get_parent().progress += speed * delta
		
func _physics_process(delta: float) -> void:
	if not get_parent() is PathFollow2D:
		if seePlayer and player != null:
			#position += (player.position - position)/speed
			var Endir = global_position.direction_to(player.global_position)
			velocity = Endir * speed
			
			var tarAngle = global_position.angle_to_point(player.global_position) - deg_to_rad(180)
			#rotation = lerp_angle(rotation, tarAngle, roSpeed * delta)
			rotation = rotate_toward(rotation, tarAngle, roSpeed * delta) 
			
		else:
			velocity = Vector2.ZERO
		move_and_slide()
		
		

func save():
	var save_dict = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x, # Vector2 is not supported by JSON
		"pos_y" : position.y,
		"rot": rotation,
		"is_alive" : is_alive,
		"name": ename,
		"damage": damage,
		"health": name
		
		}
	return save_dict


func _on_area_2d_body_entered(body: Node2D) -> void:
	player = body
	seePlayer = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	player = null
	seePlayer = false
	
