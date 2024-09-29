class_name LimitedInteractable extends Interactable

@export var limit = 1
var interactions = 0

@export var verbose := false

func activate(data: InteractionData):
	if interactions >= limit:
		return
	
	if verbose:
		print(target_name)
	super(data)
	interactions += 1
