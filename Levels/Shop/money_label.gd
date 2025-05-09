extends Label

func _process(_delta: float) -> void:
	text = "Money: $%0.2f" % [GlobalVariables.money]
