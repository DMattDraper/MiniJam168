class_name Dial extends Interactable

@onready var graphics: Node3D = $Graphics

@export var place := 0
@export var value := ""
var index = 0

@export var outside_faces: float
var spin_degrees := 0.0

var active = false
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D

func _ready() -> void:
	spin_degrees = 360.0 / outside_faces

func activate(data: InteractionData):
	if active:
		return
	
	active = true
	rotate_graphics()
	
	index += 1
	if index >= value.length():
		index = 0
	
	data.index = place
	data.value = value[index]
	super(data)

func rotate_graphics():
	var tween = get_tree().create_tween()
	
	tween.tween_property(graphics, "rotation", graphics.rotation + Vector3(deg_to_rad(spin_degrees), 0, 0), 2.0 / outside_faces)
	audio_stream_player_3d.play()
	#tween.tween_callback(graphics.queue_free)
	
	await tween.finished
	active = false
