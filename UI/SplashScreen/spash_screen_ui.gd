### splash_screen_ui,gd
extends Control

# Variables
@onready var panel: Panel = $Panel
@onready var directions: Label = $Panel/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/Directions
@onready var texture_rect: TextureRect = $Panel/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/TextureRect
@onready var texture_rect_2: TextureRect = $Panel/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/TextureRect2
@onready var label: Label = $Panel/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Label
@onready var next_button: Button = $Panel/MarginContainer/VBoxContainer/Button
@onready var v_box_container: VBoxContainer = $Panel/MarginContainer/VBoxContainer
@onready var customer_area: Node2D = $"../../CustomerArea"

const ARROWS = preload("res://UI/SplashScreen/Arrows.png")
const M_3X_6 = preload("res://UI/m3x6.ttf")

# Make Splash Screen Visible on load
func _ready() -> void:
	# Only show splash screen on day 1
	if GlobalVariables.day == 1:
		panel.visible = true
	else:
		panel.queue_free()
	
	# Pause the game

# User pressed Next
func _on_next_button_pressed() -> void:
	# Change the displayed directions
	directions.text = "Press E to interact"
	
	# Set a new image
	texture_rect.texture = ARROWS
	
	# Delete second image, label, and button
	texture_rect_2.queue_free()
	label.queue_free()
	next_button.queue_free()
	
	# Create Done button
	var new_button = Button.new()
	new_button.text = "Close"
	new_button.pressed.connect(_on_done_button_pressed)
	new_button.add_theme_font_size_override("font_size", 48)
	new_button.add_theme_font_override("font", M_3X_6)
	v_box_container.add_child(new_button)
	
# Player pressed close button (make splash screen disappear)
func _on_done_button_pressed() -> void:
	panel.visible = false
	customer_area.start_level_timer()
