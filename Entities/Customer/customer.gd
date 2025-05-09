extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var ice_cream = $IceCream
@onready var interactable: Area2D = $Interactable
@onready var player_ice_cream = $"../../../Player/IceCream"
@onready var patience_timer: Timer = $PatienceTimer
@onready var patience_bar: ProgressBar = $ProgressBar
@onready var audio_manager = $"../../../ShopAudioManager"
@onready var summary_screen_ui: Control = $"../../../CanvasLayer/SummaryScreenUI"
var patience_time = 15

func _ready():
	interactable.interact = _on_interact
	
	# Set sprite
	sprite_2d.frame = randi() % 16

	# Set variables depending on day
	var available_flavors
	var available_toppings
	match GlobalVariables.day:
		1:
			available_flavors = 3
			available_toppings = 0
		2:
			available_flavors = 4
			available_toppings = 0
		3:
			available_flavors = 4
			available_toppings = 1
		4:
			available_flavors = 5
			available_toppings = 1
		5:
			available_flavors = 5
			available_toppings = 2

	# Create random order
	ice_cream.add_cone()
	var num_of_scoops = (randi() % 3) + 1
	for i in range(num_of_scoops):
		var flavor = (randi() % available_flavors)
		ice_cream.add_scoop(flavor)
	if available_toppings > 0:
		var num_of_toppings = (randi() % 3)
		for i in range(num_of_toppings):
			var type = (randi() % available_toppings)
			ice_cream.add_topping(type)
	patience_timer.start(patience_time)
	
func _process(_delta: float) -> void:
	patience_bar.value = patience_timer.time_left
	if patience_bar.value < patience_time/3:
		patience_bar.get("theme_override_styles/fill").bg_color = Color.DARK_RED
	elif patience_bar.value < (patience_time/3) * 2:
		patience_bar.get("theme_override_styles/fill").bg_color = Color.GOLDENROD
	else:
		patience_bar.get("theme_override_styles/fill").bg_color = Color.DARK_GREEN
	
func _on_interact():
	# Sort toppings to disregard list order
	var player_toppings = player_ice_cream.toppings.duplicate()
	var customer_toppings = ice_cream.toppings.duplicate()
	player_toppings.sort()
	customer_toppings.sort()
	
	if player_ice_cream.has_cone && player_ice_cream.scoops == ice_cream.scoops && player_toppings == customer_toppings:
		#print("Correct order!")
		summary_screen_ui.customers_served += 1
		var profit = (ice_cream.scoops.size() * 1) + (ice_cream.toppings.size() * 0.5)
		GlobalVariables.money += profit
		summary_screen_ui.profit += profit
		player_ice_cream.clear()
		audio_manager.play_coins()
		queue_free()
	else:
		print("Wrong order!")

func _on_patience_timer_timeout() -> void:
	print("Customer got too impatient!")
	summary_screen_ui.customers_lost += 1
	audio_manager.play_leave()
	queue_free()
