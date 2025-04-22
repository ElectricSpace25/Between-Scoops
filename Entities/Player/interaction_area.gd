extends Area2D

@onready var interact_label: Label = $"../InteractLabel"
var current_interactions = []
var can_interact = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and can_interact:
		if current_interactions:
			can_interact = false
			await current_interactions[0].interact.call()
			can_interact = true

func _process(_delta: float) -> void:
	if current_interactions and can_interact:
		current_interactions.sort_custom((_sort_by_nearest))
		for interaction in current_interactions:
			interaction.get_parent().modulate = Color(1, 1, 1)
		current_interactions[0].get_parent().modulate = Color(1.1, 1.1, 1.1)
		interact_label.show()
	else:
		interact_label.hide()

func _sort_by_nearest(area1, area2):
	var area1_dist = global_position.distance_to(area1.global_position)
	var area2_dist = global_position.distance_to(area2.global_position)
	return area1_dist < area2_dist

func _on_area_entered(area: Area2D) -> void:
	current_interactions.push_back(area)

func _on_area_exited(area: Area2D) -> void:
	current_interactions.erase(area)
	area.get_parent().modulate = Color(1, 1, 1)
