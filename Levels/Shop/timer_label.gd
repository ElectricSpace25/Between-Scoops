extends Label

@onready var level_timer : Timer = $"../../../../../LevelTimer"

func _process(_delta):
	if level_timer.is_stopped():
		text = "Time: "
	else:
		text = "Time: %d" % [ceil(level_timer.time_left)]
