class_name AudioEmitter extends Interactable

@export var audio: AudioStream

func activate(data: InteractionData):
	super(data)
	if wait_time > 0.0:
		await get_tree().create_timer(wait_time).timeout
	$AudioStreamPlayer.play()

func _ready() -> void:
	$AudioStreamPlayer.stream = audio
