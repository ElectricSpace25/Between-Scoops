extends Node2D

@onready var interactable: Area2D = $Interactable
@onready var bedroom: Node2D = $".."
@onready var transitioner: Control = $"../CanvasLayer/Transitioner"

func _ready():
	interactable.interact = _on_interact
	
func _on_interact():
	if bedroom.can_sleep == true:
		GlobalVariables.day += 1
		transitioner.transition_to("res://Levels/Shop/shop.tscn")
