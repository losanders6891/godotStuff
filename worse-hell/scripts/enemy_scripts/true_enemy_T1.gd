class_name EnemyOverworld extends CharacterBody2D

@export_category("battle stats")
@export var health:int = 10
@export var damage:int = 1
var is_alive = true
var speed:int = 35
var direction:int = 1
var seePlayer:bool = false
var player = null

#@export var pathIsHereT1
@onready var pathFollowT1

##if you can't figure out what this is asking for, then just ask me.
@export var battle_Scene:PackedScene
		
	
func _physics_process(delta: float) -> void:
	if !is_alive:
		queue_free()
	if seePlayer:
		position += (player.position - position)/speed
		
	
	
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
