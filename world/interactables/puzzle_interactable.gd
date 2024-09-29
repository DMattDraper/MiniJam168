class_name PuzzleInteractable extends Interactable

@export var target_string := ""
@export var character_array := ""

func activate(data: InteractionData):
	character_array[data.index] = data.value
	print(character_array)
	if character_array == target_string:
		super(data)
		$Success.play()
