class_name CounterInteractable extends Interactable

@export var target_count := 2
var count := 0

@export var verbose := false

func activate(data: InteractionData):
	count += 1
	if count >= target_count:
		super(data)
		return
	
	if verbose:
		print(count)
