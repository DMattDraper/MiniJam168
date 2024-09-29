class_name EndLevel extends Interactable

func activate(data: InteractionData):
	super(data)
	animation_player.play("end_level")
	if wait_time > 0.0:
		await get_tree().create_timer(wait_time).timeout
	GameManager.restart()
