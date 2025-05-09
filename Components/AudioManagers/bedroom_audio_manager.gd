extends Node2D

@onready var background: AudioStreamPlayer2D = $Background
@onready var knock: AudioStreamPlayer2D = $Knock

func play_background():
	background.play()

func play_knock():
	knock.play()

func _on_background_finished() -> void:
	background.play()
