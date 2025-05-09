extends Node2D

@onready var audio_manager: Node2D = $PartyAudioManager
@onready var player: CharacterBody2D = $Player

func _ready() -> void:
	player.can_move = false
	audio_manager.play_horn()
	await get_tree().create_timer(3.0).timeout
	audio_manager.play_background()
	player.can_move = true
	
