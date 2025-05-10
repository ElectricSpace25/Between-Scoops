### splash_screen_ui.gd
extends Control

# Variables
@onready var panel: Panel = $Panel
@onready var title: Label = $Panel/MarginContainer/VBoxContainer/Title
@onready var directions: Label = $Panel/MarginContainer/VBoxContainer/Directions
@onready var texture_rect: TextureRect = $Panel/MarginContainer/VBoxContainer/HBoxContainer/TextureRect
@onready var texture_rect_2: TextureRect = $Panel/MarginContainer/VBoxContainer/HBoxContainer/TextureRect2
@onready var label: Label = $Panel/MarginContainer/VBoxContainer/HBoxContainer/Label
@onready var button_1: Button = $Panel/MarginContainer/VBoxContainer/HBoxContainer2/Button1
@onready var button_2: Button = $Panel/MarginContainer/VBoxContainer/HBoxContainer2/Button2
@onready var v_box_container: VBoxContainer = $Panel/MarginContainer/VBoxContainer
@onready var h_box_container: HBoxContainer = $Panel/MarginContainer/VBoxContainer/HBoxContainer
@onready var customer_area: Node2D = $"../../CustomerArea"
@onready var player: Node2D = $"../../Player"

# Make Splash Screen Visible on load
func _ready() -> void:
	# Only show splash screen on day 1
	if GlobalVariables.day == 1:
		visible = true
		player.can_move = false
	else:
		panel.queue_free()
	
	# Pause the game
	
func _on_button_1_pressed() -> void:
	GlobalVariables.style = 0
	show_movement_instructions()

func _on_button_2_pressed() -> void:
	GlobalVariables.style = 1
	show_movement_instructions()

func show_movement_instructions() -> void:
	player.choose_sprite()
	title.text = "Controls"
	directions.text = "Use WASD or arrow keys to move around"
	button_2.queue_free()
	button_1.text = "Next"
	button_1.pressed.disconnect(_on_button_1_pressed)
	button_1.pressed.connect(_on_next_button_pressed)

	texture_rect.texture = preload("res://UI/SplashScreen/WASD.png")
	texture_rect_2.texture = preload("res://UI/SplashScreen/Arrows.png")
	h_box_container.add_theme_constant_override("separation", 20)

# User pressed Next
func _on_next_button_pressed() -> void:
	# Change the displayed directions
	directions.text = "Press SPACEBAR to interact"
	
	# Set a new image
	texture_rect.texture = preload("res://UI/SplashScreen/Spacebar.png")
	
	# Delete second image and label
	texture_rect_2.queue_free()
	label.queue_free()
	
	# Change button
	button_1.pressed.disconnect(_on_next_button_pressed)
	button_1.pressed.connect(_on_next2_button_pressed)
	
# User pressed Next2
func _on_next2_button_pressed() -> void:
	# Change the displayed directions
	directions.text = "Interact with ingredients to build ice cream cones that match orders from customers!"
	
	# Delete hbox
	h_box_container.queue_free()
	
	# Change button
	button_1.text = "Done"
	button_1.pressed.disconnect(_on_next2_button_pressed)
	button_1.pressed.connect(_on_done_button_pressed)
	
# User pressed close button (make splash screen disappear)
func _on_done_button_pressed() -> void:
	panel.visible = false
	player.can_move = true
	customer_area.start_level_timer()
	
