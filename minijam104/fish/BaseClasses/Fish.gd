extends Node
class_name Fish

var _id:String
var _name:String
var shot_script:Script = load("res://fish/BaseClasses/Shot.gd")
var shot:Shot
var frames:SpriteFrames
var shot_delay:float = 0.5
var rotate_speed = 100
var slide = false
var slide_speed = 1
var radius = 20
var spawn_point_count = 1

const fish_template = preload("res://fish/BaseClasses/FishTemplate.tscn")
var scene

func construct_scene():
	scene = fish_template.instance()
	scene.fish_script = self
	scene.get_node("AnimatedSprite").frames = frames
	scene.get_node("ShootTimer").wait_time = shot_delay

func finalize():
	construct_scene()
	
	shot = shot_script.new()
	shot.spawn_point_count = spawn_point_count
	shot.finalize(self)
