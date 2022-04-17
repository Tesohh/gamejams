extends Node

var db = {}

func play(src:AudioStream, caller:Node2D, positional:bool = true, volume_db:float = 1.0, pitch_scale:float = 1.0) -> String:
	var asp:Node
	if positional:
		asp = AudioStreamPlayer2D.new()
		asp.global_position = caller.global_position
	else:
		asp = AudioStreamPlayer.new()
	
	utl.current().add_child(asp)
	asp.stream = src
	var _id = String(randi())
	asp.volume_db = volume_db
	asp.pitch_scale = pitch_scale
	asp.pause_mode = Node.PAUSE_MODE_PROCESS
	asp.play()
	db[_id] = asp
	asp.connect("finished", asp, "queue_free")
	asp.connect("finished", self, "delete_from_db", [_id])
	
	return _id

func delete_from_db(_id):
	db.erase(_id)
