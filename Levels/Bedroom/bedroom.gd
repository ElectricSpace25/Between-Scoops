extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var audio_manager: Node2D = $BedroomAudioManager
@onready var door: Sprite2D = $Door
@onready var andrew: CharacterBody2D = $Andrew
@onready var celeste: CharacterBody2D = $Celeste
@onready var alex: CharacterBody2D = $Alex
@onready var andrew2: CharacterBody2D = $Andrew2
@onready var transitioner: Transitioner = $CanvasLayer/Transitioner

var can_sleep = false

func _ready() -> void:
	audio_manager.play_background()
	match GlobalVariables.day: 
		1:
			celeste.queue_free()
			alex.queue_free()
			andrew2.queue_free()
			player.can_move = false
			await get_tree().create_timer(1.5).timeout
			audio_manager.play_knock()
			await get_tree().create_timer(2.0).timeout
			door.frame = 1
			andrew.visible = true
			player.can_move = true
		2:
			andrew.queue_free()
			alex.queue_free()
			andrew2.queue_free()
			player.can_move = false
			await get_tree().create_timer(1.5).timeout
			audio_manager.play_knock()
			await get_tree().create_timer(2.0).timeout
			door.frame = 1
			celeste.visible = true
			player.can_move = true
		3:
			andrew.queue_free()
			celeste.queue_free()
			andrew2.queue_free()
			player.can_move = false
			await get_tree().create_timer(1.5).timeout
			audio_manager.play_knock()
			await get_tree().create_timer(2.0).timeout
			door.frame = 1
			alex.visible = true
			player.can_move = true
		4:
			andrew.queue_free()
			celeste.queue_free()
			alex.queue_free()
			andrew2.queue_free()
			can_sleep = true
		5:
			andrew.queue_free()
			celeste.queue_free()
			alex.queue_free()
			player.can_move = false
			await get_tree().create_timer(1.5).timeout
			audio_manager.play_knock()
			await get_tree().create_timer(2.0).timeout
			door.frame = 1
			andrew2.visible = true
			player.can_move = true

func _on_andrew_npc_leaving() -> void:
	andrew.queue_free()
	door.frame = 0
	can_sleep = true

func _on_celeste_npc_leaving() -> void:
	celeste.queue_free()
	door.frame = 0
	can_sleep = true

func _on_alex_npc_leaving() -> void:
	alex.queue_free()
	door.frame = 0
	can_sleep = true

func _on_andrew2_npc_leaving() -> void:
	if GlobalVariables.money >= 100:
		# Win game, go to party
		andrew2.queue_free()
		transitioner.transition_to("res://Levels/Party/party.tscn")
	else:
		# Lose game
		get_tree().quit()
