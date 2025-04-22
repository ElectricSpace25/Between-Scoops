extends Label

@onready var level_timer : Timer = $"../../LevelTimer"

func _process(delta):
	text = "Time: %d" % [ceil(level_timer.time_left)]
