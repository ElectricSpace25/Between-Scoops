extends Node2D

@onready var knock: AudioStreamPlayer2D = $Knock

func play_knock():
	knock.play()
