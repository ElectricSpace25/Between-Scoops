extends Node2D

@onready var cone = $Cone
@onready var scoop1 = $Scoop1
@onready var scoop2 = $Scoop2
@onready var scoop3 = $Scoop3
@onready var topping1 = $Topping1
@onready var topping2 = $Topping2

var hasCone = false
var scoops = []
var toppings = []

func add_cone():
	hasCone = true
	cone.frame = 1

func add_scoop(flavor):
	# 1 = Vanilla, 2 = Chocolate, 3 = Strawberry
	if (hasCone && scoops.size() < 3):
		if (scoops.size() == 0):
			scoop1.frame = flavor+1
		elif (scoops.size() == 1):
			scoop2.frame = flavor+1
		elif (scoops.size() == 2):
			scoop3.frame = flavor+1
		scoops.append(flavor)
	else:
		print("Can't add scoop!")
		
func add_topping(type):
	# 1 = Sprinkles, 2 = Cherry
	if (hasCone && scoops.size() > 0 && toppings.size() < 2 && not toppings.has(type)):
		# Determine if topping 1 or 2
		var topping
		if (toppings.size() == 0):
			topping = topping1
		else:
			topping = topping2
			
		# Add topping and change frame
		toppings.append(type)
		topping.frame = type + 1
		
		# Position topping
		if (scoops.size() == 1):
			topping.position.y = 0
		elif (scoops.size() == 2):
			topping.position.y = -6
		elif (scoops.size() == 3):
			topping.position.y = -12
	else:
		print("Can't add topping!")
		
func clear():
	hasCone = false
	cone.frame = 0
	scoops.clear()
	toppings.clear()
	scoop1.frame = 0
	scoop2.frame = 0
	scoop3.frame = 0
	topping1.frame = 0
	topping2.frame = 0
