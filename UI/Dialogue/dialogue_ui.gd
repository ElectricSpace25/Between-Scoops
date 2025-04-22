### dialogue_ui.gd
extends Control

@onready var panel: Panel = $CanvasLayer/Panel
@onready var dialogue_speaker: Label = $CanvasLayer/Panel/VBoxContainer/DialogueSpeaker
@onready var dialogue_text: Label = $CanvasLayer/Panel/VBoxContainer/DialogueText
@onready var dialogue_options: HBoxContainer = $CanvasLayer/Panel/VBoxContainer/DialogueOptions
