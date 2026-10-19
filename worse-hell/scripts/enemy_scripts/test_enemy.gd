class_name EnemyOverworld extends CharacterBody2D

@export_category("battle stats")
@export var health:int = 10
@export var damage:int = 1
var speed:int = 50
var seePlayer:bool = false
var player = null

##if you can't figure out what this is asking for, then just ask me.
@export var battle_Scene:PackedScene


		
	

func _physics_process(delta: float) -> void:
	if seePlayer:
		position += (player.position - position)/speed
	
	

func _on_detect_thy_nature_body_entered(body: Node2D) -> void:
	player = body
	seePlayer = true
	
func _on_detect_thy_nature_body_exited(body: Node2D) -> void:
	player = null
	seePlayer = false
