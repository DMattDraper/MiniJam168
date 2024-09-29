class_name HUD extends Control

@onready var interact_text: Label = $InteractText
@onready var alert_text: Label = $AlertText
@onready var timer: Timer = $Timer

func update_interact_text(new_text: String):
	interact_text.text = new_text

func update_alert_text(new_text: String):
	alert_text.text = new_text
	timer.start()

func clear_alert_text():
	alert_text.text = ""
