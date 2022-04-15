extends HBoxContainer


func show_tooltip(text, icon=null):
#	show()
	$Tween.interpolate_property(self, "modulate", Color("00ffffff"), Color("ffffff"), 0.1)
	$Tween.start()
	$Label.text = text
	if icon is Texture:
		$TextureRect.show()
		$TextureRect.texture = icon
	else:
		$TextureRect.hide()

func hide_tooltip():	
	$Tween.interpolate_property(self, "modulate", Color("ffffff"), Color("00ffffff"), 0.1)
	$Tween.start()
