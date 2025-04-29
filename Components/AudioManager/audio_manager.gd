extends Node2D

@onready var coins: AudioStreamPlayer = $Coins
@onready var leave: AudioStreamPlayer = $Leave
@onready var closing: AudioStreamPlayer = $Closing

func play_coins():
	coins.play()
	
func play_leave():
	leave.play()
		
func play_closing():
	closing.play()
