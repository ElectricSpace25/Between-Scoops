extends Node2D

@onready var ice_cream = $IceCream
@onready var interactable: Area2D = $Interactable
@onready var player_ice_cream = $"../IceCream"

func _ready():
	interactable.interact = _on_interact

	ice_cream.add_cone()
	var num_of_scoops = (randi() % 3) + 1
	for i in range(num_of_scoops):
		var flavor = (randi() % 3) + 1
		ice_cream.add_scoop(flavor)
	print(ice_cream.scoops)
	
func _on_interact():
	if player_ice_cream.hasCone && player_ice_cream.scoops == ice_cream.scoops:
		print("Correct order!")
	else:
		print("Wrong order!")
