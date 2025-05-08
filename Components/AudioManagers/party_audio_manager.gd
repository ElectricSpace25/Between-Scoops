extends Node2D

@onready var background: AudioStreamPlayer2D = $Background
@onready var horn: AudioStreamPlayer2D = $Horn

func play_background():
	background.play()

func play_horn():
	horn.play()
