extends Node2D

var min_wait = 1
var max_wait = 2
var wait_timer_time = get_random_timer(min_wait, max_wait)
var fish_catchable = false
var current_fish = null
var catch_sound = preload("res://audio/catch.wav")
onready var hell = get_node("Hell")

var bullets_can_hit = false

var health = 3

func reset_fish_catch_ui():
	$Tooltip.hide_tooltip()
	$Player/Exclamation.hide()
	fish_catchable = false

func get_random_timer(min_num, max_num) -> float:
		randomize()
		return rand_range(min_num, max_num)

func _ready():
	$FishWaitTimer.start(wait_timer_time)

func _on_FishWaitTimer_timeout():
	$Player/Exclamation.show()
	$Tooltip.show_tooltip("Catch", load("res://ui/icons/leftclick.png"))
	fish_catchable = true
	
	current_fish = RNGTools.pick(FishDB.db.values())
	

	Jukebox.play(catch_sound, self)

	$FishCatchTimer.start(2)
#	print(String(wait_timer_time) + " OK LETS GO")

func _on_FishCatchTimer_timeout():
	reset_fish_catch_ui()
	wait_timer_time = get_random_timer(min_wait, max_wait)
	$FishWaitTimer.start(wait_timer_time)


func _process(delta):
	if Input.is_action_just_pressed("catch_fish"):
		if fish_catchable:
			$Hell/Hook.position = $Hell/HookSpawnPos.position
			reset_fish_catch_ui()
			$FishCatchTimer.stop()
			hell.show_with_style()
			bullets_can_hit = true
#			print(current_fish)
			var f = current_fish.scene
			hell.add_child(f)
			hell.get_node("Fish").global_position = hell.get_node("FishSpawnPos").global_position
			get_node("Tooltip").show_tooltip("Avoid bullets and\ngo near the fish")
			$Hell.set_fish_name(current_fish._name)
			
			var juke = Jukebox.play(load("res://audio/fight.wav"), self)
			get_tree().paused = true
			
			yield(get_tree().create_timer(Jukebox.db[juke].stream.get_length()), "timeout")
			get_tree().paused = false
#			breakpoint


func _on_Hook_fish_catch():
	bullets_can_hit = false
	get_tree().paused = true
	var hook = $Hell/Hook
	var t = hook.get_node("Tween")
#	$Hell/Fish/Tween.interpolate_property($Hell/Fish/Tween, "position")
	t.interpolate_property(hook, "position", hook.position, $Hell/Fish.position, 0.3, Tween.TRANS_LINEAR, Tween.EASE_OUT_IN)
	t.start()
	yield(t, "tween_completed")
	
	yield(get_tree().create_timer(1), "timeout")
	
	$HealthRecap.show_with_style()
	$HealthRecap/Caught.show()
	$HealthRecap.set_caught(current_fish)
	$Hell.hide_with_style()
	reset_fish_catch_ui()
	get_tree().paused = false
	$Hell/Fish.queue_free()
	FishDB.db.erase(current_fish._id)
	
	yield(get_tree().create_timer(2), "timeout")
	
	bullets_can_hit = true
	
	if FishDB.db.keys().size() <= 0:
		$HealthRecap/Caught.hide()		
		$HealthRecap/Win.show()
		$HealthRecap/Tween.interpolate_property($HealthRecap/Win, "modulate", Color("00FFFFFF"), Color("FFFFFF"), 3)
	else:
		$FishWaitTimer.start(wait_timer_time)
		$HealthRecap.hide_with_style()
		$HealthRecap/Caught.hide()
	
	


func _on_Hook_hit():
	if bullets_can_hit:
		$Camera2D.shake()
		Jukebox.play(load("res://audio/hitHurt.wav"), self)
		bullets_can_hit = false
		get_tree().paused = true
		
		yield($Camera2D, "shook")
		yield(get_tree().create_timer(1), "timeout")
		
		$HealthRecap.show_with_style()
		$HealthRecap/Health.show()
		$Hell.hide_with_style()
		reset_fish_catch_ui()		
		get_tree().paused = false
		
		yield(get_tree().create_timer(1), "timeout")
		$Hell/Fish.queue_free()
		$HealthRecap/Health.get_children()[health - 1].queue_free()
		$Camera2D.shake()
		yield($Camera2D, "shook")
		yield(get_tree().create_timer(1), "timeout")
		FishDB.db[current_fish._id].finalize()
#		print(FishDB.db[current_fish._id])
#		breakpoint
		
		
		
		health -= 1
		if health <= 0:
			$HealthRecap/GameOver.show()			
			$HealthRecap/Tween.interpolate_property($HealthRecap/GameOver, "modulate", Color("00FFFFFF"), Color("FFFFFF"), 3)
		else:
			$FishWaitTimer.start(wait_timer_time)
			bullets_can_hit = true			
			$HealthRecap.hide_with_style()
			$HealthRecap/Health.hide()
			
	


func _on_Restart_pressed():
	FishDB._ready()
	get_tree().reload_current_scene()


func _on_Quit_pressed():
	get_tree().quit()
