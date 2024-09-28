class_name LimitedInteractable extends Interactable

@export var limit = 1
var interactions = 0

func activate(data: InteractionData):
	if interactions >= limit:
		return
	
	super(data)
	interactions += 1
