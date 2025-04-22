### dialogue.gd - serves as a data container
extends Resource

# Creating class allows us to access when we create an instance in a scene
class_name Dialogue
@export var dialogues = {}

# Load data from dialogue_data.json
func load_from_json(file_path):
	var data = FileAccess.get_file_as_string(file_path)
	var parsed_data = JSON.parse_string(data)
	if (parsed_data):
		dialogues = parsed_data
	else:
		print("Failed to parse JSON dialogues at " + str(file_path))

# Return dialogue for that specific character/NPC
# For roommates, they will pass in roommate_id
func get_npc_dialogue(npc_id):
	if (npc_id in dialogues):
		return dialogues[npc_id]["tree"]
	else:
		return []
