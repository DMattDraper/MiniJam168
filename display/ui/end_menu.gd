extends Control


func _on_restart_pressed() -> void:
	GameManager.restart()

func _on_quit_pressed() -> void:
	GameManager.quit()
