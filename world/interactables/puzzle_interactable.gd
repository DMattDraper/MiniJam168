class_name PuzzleInteractable extends Interactable

@export var target_string := ""
@export var character_array := ""

@export var verbose := false

func activate(data: InteractionData):
	character_array[data.index] = data.value

	if character_array == target_string:
		if verbose:
			print(target_name)
		super(data)
		$Success.play()
