extends CharacterBody2D

#@onready var path_follow : PathFollow2D = $Node2D/Path2D/PathFollow2D

@export_category("battle stats")
@export var health:int = 10
@export var damage:int = 1
var speed:int = 5
var direction:int = 1

@export var battle_Scene:PackedScene

func _process(delta: float) -> void:
	
	get_parent().progress += speed * delta
