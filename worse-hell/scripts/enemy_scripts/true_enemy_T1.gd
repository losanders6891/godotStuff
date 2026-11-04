class_name EnemyOverworld extends CharacterBody2D

@export_category("battle stats")
@export var health:int = 10
@export var damage:int = 1
var is_alive = true
var speed:int = 35
var direction:int = 1
var seePlayer:bool = false
var player = null
##note: this is hard coded right now, you may have to manually change it
@export var battle_Scene:PackedScene = preload("res://scenes/battle.tscn")

func _ready() -> void:
	if !self in get_tree().get_nodes_in_group("Persist"):
		add_to_group("Persist")


func _physics_process(delta: float) -> void:
	
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
		"is_alive" : is_alive,
		}
	return save_dict
