extends Area2D
class_name FishScene

var fish_script

var fish_slide_index = 1

func _ready():
	$CollisionShape2D.shape.radius = fish_script.radius * 4
	yield(get_tree().create_timer(0.2), "timeout")
	if fish_script.slide:
		$Tween.interpolate_property(self, "position", position, utl.current().get_node("Hell/FishSlide1").position, fish_script.slide_speed)
		$Tween.start()
		

func _process(delta):
	var new_rotation = $Rotater.rotation_degrees + fish_script.rotate_speed * delta
	$Rotater.rotation_degrees = fmod(new_rotation, 360)

func _on_CatchTimer_timeout():
	pass # Replace with function body.


func _on_ShootTimer_timeout():
#	print("FishSHotooot")
#	print(fish_script.shot)
	fish_script.shot.shoot()


func _on_Tween_tween_completed(object, key):
#	print("Oj")
	fish_slide_index = 1 if fish_slide_index == 2 else 2
	
	$Tween.interpolate_property(self, "position", position, utl.current().get_node("Hell/FishSlide" + String(fish_slide_index)).position, fish_script.slide_speed)
	$Tween.start()
