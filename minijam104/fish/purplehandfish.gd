extends Fish

func _init():
	self._id = "purplehandfish"
	self._name = "Purple Handfish"
	self.shot_delay = 0.2
	self.frames = load("res://fish/sprites/purplehandfish.aseprite")
#	self.shot_script = load("res://fish/shots/pyros.gd")
	self.rotate_speed = 45
	self.slide_speed = 2
	self.radius = 25
	self.spawn_point_count = 12
	self.slide = true
	finalize()
