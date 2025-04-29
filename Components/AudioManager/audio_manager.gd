extends Node2D

@onready var coins: AudioStreamPlayer = $Coins
@onready var leave: AudioStreamPlayer = $Leave


func play_coins():
	coins.play()
	
func play_leave():
	leave.play()
