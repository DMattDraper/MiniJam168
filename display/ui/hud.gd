class_name HUD extends Control

@onready var interact_text: Label = $InteractText

func update_interact_text(new_text: String):
	interact_text.text = new_text
