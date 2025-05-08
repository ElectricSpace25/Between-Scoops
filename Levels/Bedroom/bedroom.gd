extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var audio_manager: Node2D = $BedroomAudioManager
@onready var door: Sprite2D = $Door
@onready var andrew: CharacterBody2D = $Andrew

func _ready() -> void:
	audio_manager.play_background()
	if GlobalVariables.day == 1:
		player.can_move = false
		await get_tree().create_timer(1.5).timeout
		audio_manager.play_knock()
		await get_tree().create_timer(2.0).timeout
		door.frame = 1
		andrew.visible = true
		player.can_move = true
		
# REMEMBER TO INCREMENT DAY AT THE END
