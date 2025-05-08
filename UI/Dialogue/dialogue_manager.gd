### dialogue_manager.gd

extends Node2D

@onready var dialogue_ui: Control = $DialogueUI
var npc : Node = null
signal npc_leaving

# Show Dialogue taken from the npc, calling dialogue_ui
func show_dialogue(npc, text="", options={}):
	if text != "":
		# Shows an empty box
		dialogue_ui.show_dialogue(npc.roommate_name, text, options)
	else:
		# Show populated data
		var dialogue = npc.get_current_dialogue()
		if dialogue == null:
			return
		dialogue_ui.show_dialogue(npc.roommate_name, dialogue["text"], dialogue["options"])

# Hide Dialogue box, calling dialogue_ui
func hide_dialogue():
	dialogue_ui.hide_dialogue()

# Dialogue state management
func handle_dialogue_choice(option):
	# Get current dialogue of the npc we are talking to
	var current_dialogue = npc.get_current_dialogue()
	if current_dialogue == null:
		return
	
	# Update state
	var next_state = current_dialogue["options"].get(option, "start")
	npc.set_dialogue_state(next_state)
	
	# Handle state transitions
	if next_state == "end_branch":
		# Move to the next dialogue branch for that npc
		if npc.current_branch_index < npc.dialogue_resource.get_npc_dialogue(npc.roommate_id).size() - 1:
			npc.set_dialogue_tree(npc.current_branch_index + 1)
		hide_dialogue()
	elif next_state == "leave":
		# Signals roommate to leave and allows player to sleep
		npc.set_dialogue_state("start")
		hide_dialogue()
		npc_leaving.emit()
	elif next_state == "exit":
		# Reset the branch to the start
		npc.set_dialogue_state("start")
		hide_dialogue()
	else:
		show_dialogue(npc)
