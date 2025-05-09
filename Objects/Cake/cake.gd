extends Node2D

@onready var interactable: Area2D = $Interactable
@onready var player: CharacterBody2D = $"../Player"
@onready var player_interaction_icon: Sprite2D = $"../Player/InteractionIcon"
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var camera_2d: Camera2D = $"../Camera2D"
@onready var transitioner: Transitioner = $"../CanvasLayer/Transitioner"

var talked = 0

func _ready():
	interactable.interact = _on_interact
	
func _on_interact():
	if talked == 3:
		player.can_move = false
		player_interaction_icon.visible = false
		camera_2d.zoom = Vector2(6, 6)
		await get_tree().create_timer(0.5).timeout
		sprite_2d.frame = 1
		await get_tree().create_timer(0.5).timeout
		sprite_2d.frame = 2
		await get_tree().create_timer(2).timeout
		transitioner.transition_to("res://Levels/End/end.tscn")

func _on_andrew_party_talked() -> void:
	talked += 1

func _on_celeste_party_talked() -> void:
	talked += 1

func _on_alex_party_talked() -> void:
	talked += 1
