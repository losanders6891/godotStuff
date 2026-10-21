extends Node
var loseScene: PackedScene = preload("res://scenes/MainMenu.tscn")
var currentLevel: PackedScene = preload("res://scenes/levels/testLevel.tscn")

func save_state():
	pass

func win():
	PartyStats.mainCharacterStats["Health"] = PartyStats.mainCharacterStats["MaxHealth"]
	get_tree().change_scene_to_packed(BattleGlobals.currentLevel)

func lose():
	PartyStats.mainCharacterStats["Health"] = PartyStats.mainCharacterStats["MaxHealth"]
	get_tree().change_scene_to_packed(BattleGlobals.loseScene)

func _process(delta: float) -> void:
	pass
