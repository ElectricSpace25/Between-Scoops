### dialogue.gd - serves as a data container
extends Resource

class_name Dialogue
@export var dialogues = {}

# Load data from dialogue_data.json
func load_from_json(file_path):
	var data = FileAccess.get_file_as_string(file_path)
	pass
