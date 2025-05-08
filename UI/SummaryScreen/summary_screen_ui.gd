### summary_screen_ui.gd
extends Control

# Variables
@onready var title: Label = $Panel/MarginContainer/VBoxContainer/Title
@onready var stats: Label = $Panel/MarginContainer/VBoxContainer/Stats
@onready var home_button: Button = $Panel/MarginContainer/VBoxContainer/Button
@onready var player: Node2D = $"../../Player"
@onready var transitioner: Transitioner = $"../Transitioner"

var profit = 0
var customers_served = 0
var customers_lost = 0

# Make Splash Screen Invisible on load
func _ready() -> void:
	visible = false

# Function to show Summry Screen
func show_summary() -> void:
	player.can_move = false
	visible = true
	
	# Determine the day of the week
	var weekday
	match GlobalVariables.day:
		1:
			weekday = "Monday"
		2:
			weekday = "Tuesday"
		3:
			weekday = "Wednesday"
		4:
			weekday = "Thursday"
		5:
			weekday = "Friday"

	# Set title text
	title.text = "End of " + weekday
	
	# Set stats text
	stats.text = "$" + str(profit) + " earned\n" + str(customers_served) + " customer(s) served\n" + str(customers_lost) + " customer(s) lost"
	
func _on_home_button_pressed() -> void:
	GlobalVariables.day += 1
	transitioner.visible = true
	transitioner.set_next_animation(true)
	
