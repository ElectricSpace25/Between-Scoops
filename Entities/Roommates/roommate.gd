### roommate.gd
extends CharacterBody2D

@onready var interactable: Area2D = $Interactable
@onready var sprite_2d: Sprite2D = $Sprite2D
signal npc_leaving

# Add these values in the inspector panel for each roommate!
@export var roommate_id : String # use for logic checks and quest/dialogue assignments
@export var roommate_name : String # displayed on UI when player interacts

# Dialogue variables
@onready var dialogue_manager: Node2D = $DialogueManager
@export var dialogue_resource : Dialogue # instances Dialogue resource
var current_state = "start"
var current_branch_index = 0

func _ready():
	# Roommates are interactable
	interactable.interact = _on_interact
	
	# Load dialogue data & dialogue manager
	dialogue_resource.load_from_json("res://Resources/Dialogue/dialogue_data.json")
	dialogue_manager.npc = self # initialize NPC reference
	
	# Change roommate sprite
	if roommate_id.contains("andrew"):
		sprite_2d.texture = preload("res://Entities/Roommates/Andrew.png")
	elif roommate_id.contains("celeste"):
		sprite_2d.texture = preload("res://Entities/Roommates/Celeste.png")
	elif roommate_id.contains("alex"):
		sprite_2d.texture = preload("res://Entities/Roommates/Alex.png")

# When player interacts with Roommate, start the dialogue
func _on_interact():
	#print("Interacting with " + roommate_name)
	start_dialogue()

# Get roommate's individual dialogue
func start_dialogue():
	# Returns npc id's tree
	var roommate_dialogues = dialogue_resource.get_npc_dialogue(roommate_id)
	if roommate_dialogues.is_empty():
		return
	
	#get_current_dialogue()
	# Fetch dialogue and display on the UI
	dialogue_manager.show_dialogue(self)

# Get current dialogue based on current state and branch index
func get_current_dialogue():
	var roommate_dialogues = dialogue_resource.get_npc_dialogue(roommate_id)
	if current_branch_index < roommate_dialogues.size():
		for dialogue in roommate_dialogues[current_branch_index]["dialogues"]:
			if dialogue["state"] == current_state:
				#print("Roommate says: " + dialogue["text"])
				return dialogue
	return null

# Set initial Dialogue branch and state
func set_dialogue_tree(branch_index):
	current_branch_index = branch_index
	current_state = "start"

# Update Dialogue branch and state after selection
func set_dialogue_state(state):
	current_state = state

func _on_dialogue_manager_npc_leaving() -> void:
	npc_leaving.emit()
