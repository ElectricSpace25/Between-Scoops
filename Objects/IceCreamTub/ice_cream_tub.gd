extends Node2D

@onready var interactable: Area2D = $Interactable
@onready var ice_cream: Node2D = $"../Player/IceCream"
@onready var sprite2d: Sprite2D = $Sprite2D
@export var flavor = 0

func _ready():
	interactable.interact = _on_interact
	sprite2d.frame = flavor
	
func _on_interact():
	ice_cream.add_scoop(flavor)
	#print("Flavor ", flavor, " scoop added")
