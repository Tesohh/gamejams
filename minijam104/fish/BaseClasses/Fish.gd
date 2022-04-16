extends Node
class_name Fish

var _id:String
var _name:String
var shot_script:Script
var shot:Shot
var frames:SpriteFrames
var shot_delay:float = 0.5
var rotate_speed = 100
var slide = false
var slide_speed = 1
var radius = 20

const fish_template = preload("res://fish/BaseClasses/FishTemplate.tscn")
var scene

func finalize():
	scene = fish_template.instance()
	scene.fish_script = self
	scene.get_node("AnimatedSprite").frames = frames
	scene.get_node("ShootTimer").wait_time = shot_delay
	
	shot = shot_script.new()
	shot.finalize(self)
