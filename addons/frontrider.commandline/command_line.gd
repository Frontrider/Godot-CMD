tool
extends EditorPlugin

const ConsolePanel = preload("res://addons/frontrider.commandline/panel/panel.tscn")
var panel = ConsolePanel.instance()
func _enter_tree():
	add_control_to_bottom_panel(panel,"Terminal")
	pass


func _exit_tree():
	remove_control_from_bottom_panel(panel)
	pass
