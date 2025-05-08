extends Label

func _process(_delta: float) -> void:
	text = "Money: $%d" % [GlobalVariables.money]
