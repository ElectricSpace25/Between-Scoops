extends Node2D

@onready var ice_cream = $IceCream
@onready var interactable: Area2D = $Interactable
@onready var player_ice_cream = $"../../../Player/IceCream"
@onready var patience_timer: Timer = $PatienceTimer
@onready var patience_bar: ProgressBar = $ProgressBar

func _ready():
	interactable.interact = _on_interact

	# Create random order
	ice_cream.add_cone()
	var num_of_scoops = (randi() % 3) + 1
	for i in range(num_of_scoops):
		var flavor = (randi() % 3) + 1
		ice_cream.add_scoop(flavor)
	patience_timer.start()
	
func _process(delta: float) -> void:
	patience_bar.value = patience_timer.time_left
	
func _on_interact():
	if player_ice_cream.hasCone && player_ice_cream.scoops == ice_cream.scoops:
		print("Correct order!")
		GlobalVariables.money += 1
		player_ice_cream.clear()
		queue_free()
	else:
		print("Wrong order!")

func _on_patience_timer_timeout() -> void:
	print("Customer got too impatient")
	queue_free()
