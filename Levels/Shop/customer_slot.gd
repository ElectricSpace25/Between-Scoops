extends Node2D

var customer_scene = load("res://Customer/customer.tscn")

func spawn_customer():
	var new_customer = customer_scene.instantiate()
	add_child(new_customer)
	#new_customer.position = Vector2i(200, 200)
	
func clear_customer():
	for child in get_children():
		child.queue_free()
