class_name Scene extends Node3D

func _ready() -> void:
	GameManager.reset()
	UIManager.get_hud()
	InteractionManager.connect_interactables()
