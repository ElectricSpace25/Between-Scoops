extends Node2D

var customer = load("res://Customer/customer.tscn")
@onready var timer: Timer = $"../Timer"

func _ready():
	timer.start(60)
	spawn_customer()
	
func spawn_customer():
	if (not timer.is_stopped()):
		await(get_tree().create_timer((randi() % 3) + 1).timeout)
		var new_customer = customer.instantiate()
		add_child(new_customer)
		new_customer.position = Vector2i(272, 244)

func _on_timer_timeout() -> void:
	# Level timeout
	pass;
