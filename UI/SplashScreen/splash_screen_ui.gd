### splash_screen_ui.gd
extends Control

# Variables
@onready var panel: Panel = $Panel
@onready var directions: Label = $Panel/MarginContainer/VBoxContainer/Directions
@onready var texture_rect: TextureRect = $Panel/MarginContainer/VBoxContainer/HBoxContainer/TextureRect
@onready var texture_rect_2: TextureRect = $Panel/MarginContainer/VBoxContainer/HBoxContainer/TextureRect2
@onready var label: Label = $Panel/MarginContainer/VBoxContainer/HBoxContainer/Label
@onready var next_button: Button = $Panel/MarginContainer/VBoxContainer/Button
@onready var v_box_container: VBoxContainer = $Panel/MarginContainer/VBoxContainer
@onready var h_box_container: HBoxContainer = $Panel/MarginContainer/VBoxContainer/HBoxContainer
@onready var customer_area: Node2D = $"../../CustomerArea"
@onready var player: Node2D = $"../../Player"

const E = preload("res://UI/SplashScreen/E.png")
const M_3X_6 = preload("res://UI/m3x6.ttf")

# Make Splash Screen Visible on load
func _ready() -> void:
	# Only show splash screen on day 1
	if GlobalVariables.day == 1:
		panel.visible = true
		player.can_move = false
	else:
		panel.queue_free()
	
	# Pause the game

# User pressed Next
func _on_next_button_pressed() -> void:
	# Change the displayed directions
	directions.text = "Press E to interact"
	
	# Set a new image
	texture_rect.texture = E
	
	# Delete second image and label
	texture_rect_2.queue_free()
	label.queue_free()
	
	# Change button
	next_button.pressed.disconnect(_on_next_button_pressed)
	next_button.pressed.connect(_on_next2_button_pressed)
	
# User pressed Next2
func _on_next2_button_pressed() -> void:
	# Change the displayed directions
	directions.text = "Interact with ingredients to build ice cream cones that match orders from customers!"
	
	# Delete hbox
	h_box_container.queue_free()
	
	# Change button
	next_button.text = "Done"
	next_button.pressed.disconnect(_on_next2_button_pressed)
	next_button.pressed.connect(_on_done_button_pressed)
	
# User pressed close button (make splash screen disappear)
func _on_done_button_pressed() -> void:
	panel.visible = false
	player.can_move = true
	customer_area.start_level_timer()
