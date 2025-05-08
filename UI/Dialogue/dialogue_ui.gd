### dialogue_ui.gd
extends Control

@onready var panel: Panel = $CanvasLayer/Panel
@onready var dialogue_speaker: Label = $CanvasLayer/Panel/VBoxContainer/DialogueSpeaker
@onready var dialogue_text: Label = $CanvasLayer/Panel/VBoxContainer/DialogueText
@onready var dialogue_options: HBoxContainer = $CanvasLayer/Panel/VBoxContainer/DialogueOptions
var font = load("res://UI/mago2.ttf")

func _ready():
	hide_dialogue()

# Show Dialogue Box
func show_dialogue(speaker, text, options):
	panel.visible = true
	
	# Set the labels based on the values passed in
	dialogue_speaker.text = speaker
	dialogue_text.text = text
	
	# Remove previous options
	for option in dialogue_options.get_children():
		dialogue_options.remove_child(option)
	
	# Populate options
	for option in options.keys():
		var button = Button.new()
		button.text = option
		button.add_theme_font_override("font", font)
		button.add_theme_font_size_override("font_size", 48)
		button.pressed.connect(_on_option_selected.bind(option))
		dialogue_options.add_child(button)

# Handle response selection
func _on_option_selected(option):
	get_parent().handle_dialogue_choice(option)
	
# Hide Dialogue Box
func hide_dialogue():
	panel.visible = false
	#Global.player.can_move = true
