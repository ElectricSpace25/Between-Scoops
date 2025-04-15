extends Node2D

@onready var interactable: Area2D = $Interactable
@onready var ice_cream: Node2D = $"../IceCream"

func _ready():
	interactable.interact = _on_interact
	
func _on_interact():
	ice_cream.add_cone()
	print("Cone added")
