extends Node2D

@onready var level_timer: Timer = $"../LevelTimer"
@onready var spawn_timer: Timer = $"../SpawnTimer"
@onready var audio_manager = $"../ShopAudioManager"
@onready var summary_screen: Control = $"../CanvasLayer/SummaryScreenUI"

var customer_slot_scene = load("res://Components/CustomerSlot/customer_slot.tscn")
var customer_max = 2
var customer_spawn_time = 4
var level_time = 60

func _ready():
	set_difficulty()
	if GlobalVariables.day != 1:
		await(audio_manager.ready)
		start_level_timer()
	for i in range(3):
		var new_slot = customer_slot_scene.instantiate()
		add_child(new_slot)
		new_slot.position.x += 32*i
		
func start_level_timer():
	level_timer.start(level_time)
	audio_manager.play_background()
	
func set_difficulty():
	match GlobalVariables.day:
		1:
			customer_max = 2
			customer_spawn_time = 5
		2:
			customer_max = 2
			customer_spawn_time = 4
		3:
			customer_max = 3
			customer_spawn_time = 4
		4:
			customer_max = 3
			customer_spawn_time = 3
		5:
			customer_max = 3
			customer_spawn_time = 3
	
func _process(delta: float) -> void:
	if not level_timer.is_stopped():
		if get_customer_count() < customer_max && spawn_timer.is_stopped():
			#print("Starting spawn timer")
			spawn_timer.start(customer_spawn_time)
	
func attempt_spawn_customer():
	#print("Attemping customer spawn")
	for slot in get_children():
		if slot.get_child_count() == 0:
			#print("Customer spawned")
			slot.spawn_customer()
			break

func _on_level_timer_timeout():
	# Level timeout
	print("LEVEL TIMED OUT")
	spawn_timer.stop()
	audio_manager.play_closing()
	for slot in get_children():
		slot.clear_customer()
	summary_screen.show_summary()

func _on_spawn_timer_timeout() -> void:
	#print("Spawning customer on timer")
	attempt_spawn_customer()
	
func get_customer_count() -> int:
	var count = 0
	for slot in get_children():
		if slot.get_child_count() > 0:
			count += 1
	return count
	
