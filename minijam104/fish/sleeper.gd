extends Fish

func _init():
	self._id = "sleeper"
	self._name = "Ornate Sleeper Ray"
	self.shot_delay = 0.4
	self.frames = load("res://fish/sprites/sleeper.aseprite")
#	self.shot_script = load("res://fish/shots/pyros.gd")
	self.rotate_speed = 5
#	self.slide_speed = 0.5
	self.radius = 25
	self.spawn_point_count = 30
#	self.slide = true
	finalize()
