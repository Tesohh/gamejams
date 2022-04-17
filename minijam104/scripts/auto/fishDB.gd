extends Node

var db = {}

var test_fish = null

func _ready():
	for i in list_files_in_directory("res://fish/"):
		var f = load(i).new()
		db[f._id] = f
	print(db)

func list_files_in_directory(path):
		var files = []
		var dir = Directory.new()
		dir.open(path)
		dir.list_dir_begin()

		var test_mode = test_fish is String
		if test_mode:
			print("-- FISH TEST MODE --")

		while true:
				var file = dir.get_next()
				if file == "":
						break
				
				elif not file.begins_with(".") and file.ends_with(".gd"):
					if test_mode and file != test_fish+".gd":
						print("found fish which is not %s, instead it's %s" % [test_fish, file])
						continue
					files.append("res://fish/" + file)

		dir.list_dir_end()

		return files
