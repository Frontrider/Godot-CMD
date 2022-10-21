extends Reference

var username:String
var hostname:String
var prefix:String

func _init():
	#get the current user
	if OS.has_environment("USER"):
		username = OS.get_environment("USER")
	elif OS.has_environment("USERNAME"):
		username = OS.get_environment("USERNAME")
	else:
		username = "godot"
	var output = []
	OS.execute("hostname", [], true, output )
	if not output.empty():
		hostname = (output[0] as String).trim_suffix("\n")
	else:
		hostname = "godot"
	prefix = "["+username+"@"+hostname+" ~]$ "
	pass

func get_prefix()->String:
	return prefix

func execute(command:String)->Array:
	var output = []
	var parts = command.split(" ")
	var executeable = parts[0]
	parts.remove(0)
	OS.execute(executeable, parts, true, output,true,true)
	return output
	pass
