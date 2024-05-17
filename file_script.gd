extends Node2D
var grid:GridContainer
signal return_file


func dir_contents(path):
	var dir = DirAccess.open(path)
	var directories = []
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		var x:PackedScene = load("res://dir_button.tscn")
		
		while file_name != "":
			
			var button:Button = x.instantiate()
			if dir.current_is_dir():
				print("Found directory: " + file_name)
				button.set_type("folder")
			else:
				button.set_type("file")
				print("Found file: " + file_name)
			button.text = file_name
			button.connect("action", loadDir)
			grid.add_child(button)
			button.set_dir(path + "/" + file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
	return directories


func loadDir(type , dir):
	print(type)
	#if type == "folder":
		#for child in grid.get_children():
			#child.queue_free()
		#dir_contents(dir)
	#if type == "file":
		#return_file.emit(dir)
		
	


func _ready():
	grid = $ScrollContainer/GridContainer
	
	var data = dir_contents("/Users")
	#for i in data:
		#var button:Button = x.instantiate()
		#button.text = i
		#grid.add_child(button)
	
	
