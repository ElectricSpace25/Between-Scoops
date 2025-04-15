extends Node2D

@onready var scoop1 = $Scoop1
@onready var scoop2 = $Scoop2
@onready var scoop3 = $Scoop3

var scoops = 0

#func _ready():
	#add_scoop(3)

func add_scoop(flavor):
	# 1 = Vanilla, 2 = Chocolate, 3 = Strawberry
	if (scoops == 0):
		scoop1.frame = flavor
	elif (scoops == 1):
		scoop2.frame = flavor
	elif (scoops == 2):
		scoop3.frame = flavor
	else:
		print("Max scoops reached!")
	
	scoops += 1
