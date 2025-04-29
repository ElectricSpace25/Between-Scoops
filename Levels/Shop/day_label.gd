extends Label

func _ready():
	var weekday
	match GlobalVariables.day:
		1:
			weekday = "Monday"
		2:
			weekday = "Tuesday"
		3:
			weekday = "Wednesday"
		4:
			weekday = "Thursday"
		5:
			weekday = "Friday"
	text = weekday
