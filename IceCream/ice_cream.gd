extends Node2D

@onready var cone = $Cone
@onready var scoop1 = $Scoop1
@onready var scoop2 = $Scoop2
@onready var scoop3 = $Scoop3

var hasCone = false
var scoops = []
var toppings = []

func add_cone():
	hasCone = true
	cone.frame = 1

func add_scoop(flavor):
	# 1 = Vanilla, 2 = Chocolate, 3 = Strawberry
	if (hasCone):
		if (scoops.size() == 0):
			scoops.append(flavor)
			scoop1.frame = flavor
		elif (scoops.size() == 1):
			scoops.append(flavor)
			scoop2.frame = flavor
		elif (scoops.size() == 2):
			scoops.append(flavor)
			scoop3.frame = flavor
		else:
			print("Max scoops reached!")
	else:
		print("No cone!")
		
func clear():
	hasCone = false
	cone.frame = 0
	scoops.clear()
	scoop1.frame = 0
	scoop2.frame = 0
	scoop3.frame = 0
