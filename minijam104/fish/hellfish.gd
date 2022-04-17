extends Fish

func _init():
	self._id = "hellfish"
	self._name = "Hellfish"
	self.shot_delay = 0.1
	self.frames = load("res://fish/sprites/hellfish.aseprite")
#	self.shot_script = load("res://fish/shots/pyros.gd")
	self.rotate_speed = 50
	self.slide_speed = 0.3
	self.radius = 30
	self.spawn_point_count = 8
	self.slide = true
	finalize()
