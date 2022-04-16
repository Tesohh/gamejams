extends Node

var db = {}

func _ready():
	for i in list_files_in_directory("res://fish"):
		var f = load(i).new()
		db[f._id] = f
	print(db)

func list_files_in_directory(path):
		var files = []
		var dir = Directory.new()
		dir.open(path)
		dir.list_dir_begin()

		while true:
				var file = dir.get_next()
				if file == "":
						break
				elif not file.begins_with(".") and file.ends_with(".gd"):
						files.append("res://fish/" + file)

		dir.list_dir_end()

		return files
