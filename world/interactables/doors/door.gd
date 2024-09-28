class_name Door extends Interactable

var open = false

func activate(data: InteractionData):
	super(data)
	if open:
		animation_player.play("close")
	else:
		animation_player.play("open")
