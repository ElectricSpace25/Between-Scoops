extends Label

@onready var timer : Timer = $"../../Timer"

func _process(delta):
	text = "Time: %d" % [int(timer.time_left)]
