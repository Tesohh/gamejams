extends Node

func play(src:AudioStream, caller:Node2D, positional:bool = true, volume_db:float = 1.0, pitch_scale:float = 1.0) -> void:
	var asp:Node
	if positional:
		asp = AudioStreamPlayer2D.new()
		asp.global_position = caller.global_position
	else:
		asp = AudioStreamPlayer.new()
		
	utl.current().add_child(asp)
	asp.stream = src
	asp.volume_db = volume_db
	asp.pitch_scale = pitch_scale
	asp.play()
	asp.connect("finished", asp, "queue_free")
