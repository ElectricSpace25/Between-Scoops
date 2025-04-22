extends Node2D

@onready var level_timer: Timer = $"../LevelTimer"
@onready var spawn_timer: Timer = $"../SpawnTimer"
var customer_slot_scene = load("res://Levels/Shop/customer_slot.tscn")

func _ready():
	level_timer.start(60)
	for i in range(3):
		var new_slot = customer_slot_scene.instantiate()
		add_child(new_slot)
		new_slot.position = Vector2i(272+(32*i), 244)
	
func _process(delta: float) -> void:
	if (not level_timer.is_stopped()):
		if (get_customer_count() < 3 && spawn_timer.is_stopped()):
			print("Starting spawn timer")
			spawn_timer.start()
	
func attempt_spawn_customer():
	print("Attemping customer spawn")
	for slot in get_children():
		if (slot.get_child_count() == 0):
			print("Customer spawned")
			slot.spawn_customer()
			break

func _on_level_timer_timeout():
	# Level timeout
	print("LEVEL TIMED OUT")
	spawn_timer.stop()
	for slot in get_children():
		slot.clear_customer()

func _on_spawn_timer_timeout() -> void:
	print("Spawning customer on timer")
	attempt_spawn_customer()
	
func get_customer_count() -> int:
	var count = 0
	for slot in get_children():
		if(slot.get_child_count() > 0):
			count += 1
	return count
	
