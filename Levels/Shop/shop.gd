extends Node2D

@onready var mint_tub = $MintTub
@onready var lemon_tub = $LemonTub
@onready var sprinkles_tub = $SprinklesTub
@onready var cherries_tub = $CherriesTub

func _ready() -> void:
	match GlobalVariables.day:
		1:
			# 3 Flavors
			mint_tub.queue_free()
			lemon_tub.queue_free()
			sprinkles_tub.queue_free()
			cherries_tub.queue_free()
		2:
			# 4 flavors
			mint_tub.visible = true
			lemon_tub.queue_free()
			sprinkles_tub.queue_free()
			cherries_tub.queue_free()
		3:
			# 4 flavors, 1 topping
			mint_tub.visible = true
			sprinkles_tub.visible = true
			lemon_tub.queue_free()
			cherries_tub.queue_free()
		4:
			# 5 flavors, 1 topping
			mint_tub.visible = true
			sprinkles_tub.visible = true
			lemon_tub.visible = true
			cherries_tub.queue_free()
		5:
			# 5 flavors, 2 toppings
			mint_tub.visible = true
			sprinkles_tub.visible = true
			lemon_tub.visible = true
			cherries_tub.visible = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("cheat_next_day"):
		if GlobalVariables.day < 5:
			GlobalVariables.day += 1
		get_tree().reload_current_scene()
