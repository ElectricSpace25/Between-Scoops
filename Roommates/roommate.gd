### roommate.gd
extends CharacterBody2D

@onready var interactable: Area2D = $Interactable

# Add these values in the inspector panel for each roommate!
@export var roommate_id : String # use for logic checks and quest/dialogue assignments
@export var roommate_name : String # displayed on UI when player interacts

func _ready():
	interactable.interact = _on_interact

func _on_interact():
	start_dialogue()

func start_dialogue():
	print("Hello from Roommate!")
