extends Camera2D

signal shook

func shake():
	for i in range(5):
		$Tween.interpolate_property(self, "position:x", position.x, position.x + 10, 0.04)
		$Tween.start()
		yield($Tween, "tween_completed")
		$Tween.interpolate_property(self, "position:x", position.x, position.x - 10, 0.04)
		$Tween.start()
		yield($Tween, "tween_completed")
	emit_signal("shook")
