extends Node2D

var min_wait = 1
var max_wait = 2
var wait_timer_time = get_random_timer(min_wait, max_wait)
var fish_catchable = false
var catch_sound = preload("res://audio/catch.wav")

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

	Jukebox.play(catch_sound, self)

	$FishCatchTimer.start(2)
	print(String(wait_timer_time) + " OK LETS GO")

func _on_FishCatchTimer_timeout():
	reset_fish_catch_ui()
	wait_timer_time = get_random_timer(min_wait, max_wait)
	$FishWaitTimer.start(wait_timer_time)


func _process(delta):
	if Input.is_action_just_pressed("catch_fish"):
		if fish_catchable:
			reset_fish_catch_ui()
			$FishCatchTimer.stop()
			print("FISH...")
