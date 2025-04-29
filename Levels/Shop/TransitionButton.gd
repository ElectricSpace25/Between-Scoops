extends CheckButton

@export var transitioner : Transitioner


func _on_toggled(toggled_on: bool) -> void:
	transitioner.visible = true
	transitioner.set_next_animation(toggled_on)
