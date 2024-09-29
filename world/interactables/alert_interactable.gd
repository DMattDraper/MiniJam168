class_name AlertInteractable extends Interactable

func activate(data: InteractionData):
	super(data)
	if wait_time > 0.0:
		await get_tree().create_timer(wait_time).timeout
	UIManager.update_alert_text(message)
