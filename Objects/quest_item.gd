### quest_item.gd

@tool # allows us to execute code while in editor, not just in game
extends Area2D

@onready var sprite_2d = $Sprite2D

# Vars
@export var item_id: String = ""
@export var item_quantity: int = 1
@export var item_texture = Texture2D

# Show item texture in game
func _ready():
	if not Engine.is_editor_hint():
		sprite_2d.texture = item_texture

# Show item texture in engine
func _process(delta):
	if Engine.is_editor_hint():
		sprite_2d.texture = item_texture
