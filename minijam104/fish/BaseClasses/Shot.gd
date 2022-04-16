extends Node
class_name Shot

#https://www.youtube.com/watch?v=Z2TaFnN7cdU&list=LL&index=2
const bullet_scene = preload("res://fish/BaseClasses/Bullet.tscn")


#var shooter_timer_wait_time = 0.2
var spawn_point_count = 4
#var turrets = []

var blank = false

var fish

func finalize(_fish):
	fish = _fish
	var step = 2 * PI / spawn_point_count
	var rotater = Node.new()
		
	for i in range(spawn_point_count):
		var spawn_point = Node2D.new()
		var pos = Vector2(fish.radius, 0).rotated(step * i)
		spawn_point.position = pos
		spawn_point.rotation = pos.angle()
		fish.scene.get_node("Rotater").add_child(spawn_point)

func shoot():
	for s in fish.scene.get_node("Rotater").get_children():
		var bullet = bullet_scene.instance()
		utl.current().add_child(bullet)
		bullet.position = s.global_position
		bullet.rotation = s.global_rotation
		
