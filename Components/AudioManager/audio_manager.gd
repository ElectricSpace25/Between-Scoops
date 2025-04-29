extends Node2D

@onready var background: AudioStreamPlayer = $BackgroundMusic
@onready var coins: AudioStreamPlayer = $Coins
@onready var leave: AudioStreamPlayer = $Leave
@onready var closing: AudioStreamPlayer = $Closing
@onready var trash: AudioStreamPlayer = $Trash

func play_background():
	background.play()

func play_coins():
	coins.play()
	
func play_leave():
	leave.play()
		
func play_closing():
	closing.play()
	
func play_trash():
	trash.play()
