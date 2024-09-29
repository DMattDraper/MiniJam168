extends Control

@onready var sfx_slider: HSlider = $MarginContainer/VBoxContainer/GridContainer/sfx_slider
@onready var music_slider: HSlider = $MarginContainer/VBoxContainer/GridContainer/music_slider

func _on_sfx_slider_value_changed(value):
	SettingsManager.update_sfx_vol(value)

func _on_music_slider_value_changed(value):
	SettingsManager.update_music_vol(value)

func set_sfx_slider(value):
	sfx_slider.value = value

func set_music_slider(value):
	music_slider.value = value

func _on_button_pressed() -> void:
	GameManager.unpause()
