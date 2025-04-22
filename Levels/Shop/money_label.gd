extends Label

func _process(delta):
	text = "Money: $%d" % [GlobalVariables.money]
