extends KinematicBody2D

# https://www.youtube.com/watch?v=Z2TaFnN7cdU&list=LL&index=2

func _process(delta):
	position += transform.x * 100 * delta


func _on_Timer_timeout():
	queue_free()
