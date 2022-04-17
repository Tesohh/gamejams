extends Node2D

func hide_with_style():
	$Tween.interpolate_property(self, "modulate", Color("FFFFFF"), Color("00FFFFFF"), 0.2)
	$Tween.start()
	

func show_with_style():
	show()
	$Tween.interpolate_property(self, "modulate", Color("00FFFFFF"), Color("FFFFFF"), 0.2)
	$Tween.start()


func _on_Tween_tween_completed(object, key):
	if modulate == Color("00FFFFFF"):
		hide()

func set_fish_name(_name):
	$FishName.show()
	$FishName.text = _name
	
#	$FishName/Tween.interpolate_property($FishName, "modulate", Color("00FFFFFF"), Color("FFFFFFF"), 0.1)
#	$FishName/Tween.start()	
##	$FishName/Tween.interpolate_property($FishName, "modulate", Color("FFFFFF"), Color("00FFFFFF"), 0.2)
#	yield($FishName/Tween, "tween_completed")
	
	yield(get_tree().create_timer(1), "timeout")
	
	$FishName/Tween.interpolate_property($FishName, "modulate", Color("FFFFFF"), Color("00FFFFFF"), 0.2)
	$FishName/Tween.start()	
	yield($FishName/Tween, "tween_completed")
	
	$FishName.hide()
	$FishName.modulate = Color("FFFFFF")
