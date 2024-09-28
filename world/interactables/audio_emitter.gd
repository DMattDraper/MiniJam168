class_name AudioEmitter extends Interactable

@export var audio: AudioStream

func _ready() -> void:
	$AudioStreamPlayer.stream = audio
