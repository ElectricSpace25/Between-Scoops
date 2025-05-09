extends Node2D

@onready var interactable: Area2D = $Interactable

func _ready():
	interactable.interact = _on_interact
	
func _on_interact():
	print("END GAME")
	#TODO: End game
