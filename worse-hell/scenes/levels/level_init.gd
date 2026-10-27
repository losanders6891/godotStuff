extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !BattleGlobals.scene_saved:
		BattleGlobals.save_scene()
	else:
		BattleGlobals.load_scene()
