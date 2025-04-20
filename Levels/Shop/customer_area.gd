extends Node2D

var customer = load("res://Customer/customer.tscn")

func _ready():
	spawn_customer()
	
func spawn_customer():
	await(get_tree().create_timer((randi() % 3) + 1).timeout)
	var new_customer = customer.instantiate()
	add_child(new_customer)
	new_customer.position = Vector2i(272, 244)
	
		
