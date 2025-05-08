extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var audio_manager: Node2D = $BedroomAudioManager

func _ready() -> void:
	audio_manager.play_background()
	if GlobalVariables.day == 1:
		player.can_move = false
		await get_tree().create_timer(1.0).timeout
		audio_manager.play_knock()
		
# REMEMBER TO INCREMENT DAY AT THE END
