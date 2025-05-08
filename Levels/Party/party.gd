extends Node2D

@onready var audio_manager: Node2D = $PartyAudioManager


func _ready() -> void:
	audio_manager.play_horn()
	await get_tree().create_timer(3.0).timeout
	audio_manager.play_background()
	
