extends Node2D

var customer = load("res://Customer/customer.tscn")

func _ready():
	var new_customer = customer.instantiate()
	add_child(new_customer)
	new_customer.position = Vector2i(272, 244)
