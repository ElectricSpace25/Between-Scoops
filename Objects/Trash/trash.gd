extends Node2D

@onready var interactable: Area2D = $Interactable
@onready var ice_cream: Node2D = $"../Player/IceCream"
@onready var audio_manager = $"../ShopAudioManager"

func _ready():
	interactable.interact = _on_interact
	
func _on_interact():
	if ice_cream.has_cone:
		ice_cream.clear()
		audio_manager.play_trash()
