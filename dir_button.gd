extends Button
var type
var dir
signal action(type, dir)
signal select(node)
func set_type(new_type : String):
	type = new_type
func set_dir(new_dir):
	dir = new_dir





func _on_toggled(toggled_on):
	if toggled_on == false:
		action.emit(type, dir)
	else:
		select.emit(self)
