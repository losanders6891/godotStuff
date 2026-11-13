class_name BattleGuiManager extends Node

@export var invGUI: ScrollContainer
@export var battleOptionsGUI: GridContainer
@export var attackOptionsGUI: GridContainer

static var invVis = false
static var battleOptionsVis = true
static var attackOptionsVis = false

func _process(delta: float) -> void:
	invGUI.visible = invVis
	battleOptionsGUI.visible = battleOptionsVis
	attackOptionsGUI.visible = attackOptionsVis
