extends Fish

func _init():
	self._id = "sakhalinsurgeon"
	self._name = "Sakhalin Surgeon"
	self.frames = load("res://fish/sprites/sakhalinsurgeon.aseprite")
	self.shot_delay = 0.15
	#	self.shot_script = load("res://fish/shots/pyros.gd")
	self.rotate_speed = 100
	#	self.slide_speed = 2
	self.radius = 25
	self.spawn_point_count = 8
	#	self.slide = true
	finalize()

