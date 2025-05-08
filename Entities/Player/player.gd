extends CharacterBody2D

var move_speed : float = 125
var can_move = true # added to pause movement when interacting with roommates

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

# Player HUD UI components
@onready var quest_tracker: ColorRect = $HUD/QuestTracker
@onready var title: Label = $HUD/QuestTracker/VBoxContainer/Title
@onready var objectives: VBoxContainer = $HUD/QuestTracker/VBoxContainer/Objectives

func _ready() -> void:
	#Global.player = self
	quest_tracker.visible = false

func _physics_process(_delta):
	# Move
	if can_move:
		var input_direction = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
		velocity = input_direction * move_speed
		move_and_slide()
		pick_new_state()
		update_animation_parameters(input_direction)

func update_animation_parameters(move_input : Vector2):
	if move_input != Vector2.ZERO:
		animation_tree.set("parameters/Walk/blend_position", move_input)
		animation_tree.set("parameters/Idle/blend_position", move_input)

func pick_new_state():
	if velocity != Vector2.ZERO:
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")
