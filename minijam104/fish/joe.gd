extends Fish

func _init():
	self._id = "joe"
	self._name = "Joe"
	self.shot_delay = 0.1
	self.frames = load("res://fish/sprites/joe.aseprite")
#	self.shot_script = load("res://fish/shots/pyros.gd")
	self.rotate_speed = 50
	self.slide_speed = 0.5
	self.radius = 25
	self.spawn_point_count = 8
	self.slide = true
	finalize()
