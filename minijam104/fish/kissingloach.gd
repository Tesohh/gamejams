extends Fish

func _init():
	self._id = "kissingloach"
	self._name = "Kissing Loach"
	self.shot_delay = 0.15
	self.frames = load("res://fish/sprites/kissingloach.aseprite")
#	self.shot_script = load("res://fish/shots/pyros.gd")
	self.rotate_speed = 120
#	self.slide_speed = 2
	self.radius = 25
	self.spawn_point_count = 8
#	self.slide = true
	finalize()
