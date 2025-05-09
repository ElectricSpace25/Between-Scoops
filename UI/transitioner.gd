extends Control
class_name Transitioner

# Take TectureRect and assign to variable
@onready var animation_tex : TextureRect = $TextureRect
@onready var animation_player : AnimationPlayer = $AnimationPlayer

@export var scene_switch_anim : String = "fade_out"
var scene_to_load: String

# Make sure TextureRect is not visible when the game starts
func _ready() -> void:
	animation_tex.visible = false
	
func transition_to(scene: String):
	scene_to_load = scene
	visible = true
	set_next_animation(true)
	
# Cheat to instantly transition to bedroom
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("cheat_transition"):
		transition_to("res://Levels/Bedroom/bedroom.tscn")	

# TODO: Change button to actual cue for transition
# Fades the animation based on a cue
func set_next_animation(fading_out : bool):
	if (fading_out):
		# Wait for current animation to finish before fading
		# To automatically cause animation, use .play
		animation_player.queue("fade_out")
	else:
		animation_player.queue("fade_in")

# If we just played fade out animation, switch to a new scene (level), set in Scene to Load
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if (scene_to_load != null && anim_name == scene_switch_anim):
		get_tree().change_scene_to_file(scene_to_load)
		
