extends Control


func hide_with_style():
	$Tween.interpolate_property(self, "modulate", Color("FFFFFF"), Color("00FFFFFF"), 0.2)
	$Tween.start()
	

func show_with_style():
	show()
	$Tween.interpolate_property(self, "modulate", Color("00FFFFFF"), Color("FFFFFF"), 0.01)
	$Tween.start()


func _on_Tween_tween_completed(object, key):
	if modulate == Color("00FFFFFF"):
		hide()
func set_caught(fish:Fish):
		
	$Caught/Label.text = "Caught " + fish._name
	$Caught/TextureRect.texture = fish.frames.get_frame("default", 0)
	
