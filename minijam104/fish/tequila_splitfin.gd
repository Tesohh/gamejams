extends Fish

func _init():
	self._id = "tequila_splitfin"
	self._name = "Tequila Splitfin"
	self.shot_delay = 0.2
	self.frames = load("res://fish/sprites/tequilasplitfin.aseprite")
	self.shot_script = load("res://fish/shots/pyros.gd")
	self.rotate_speed = 100
	self.slide = true
	finalize()
