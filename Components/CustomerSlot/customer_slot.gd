extends Node2D

var customer_scene = load("res://Entities/Customer/customer.tscn")

func spawn_customer():
	var new_customer = customer_scene.instantiate()
	add_child(new_customer)
	
func clear_customer():
	for child in get_children():
		child.queue_free()
