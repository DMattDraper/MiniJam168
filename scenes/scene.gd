class_name Scene extends Node3D

func _ready() -> void:
	UIManager.get_hud()
	InteractionManager.connect_interactables()
