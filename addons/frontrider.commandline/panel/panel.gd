tool
extends Control

var executor = preload("res://addons/frontrider.commandline/command_executor.gd").new()
# Called when the node enters the scene tree for the first time.
func _ready():
	set_host()
	pass

func set_host():
	$"%HostLabel".text = executor.get_prefix()
	pass

func _on_Input_text_entered(input_text:String):
	var term =  $"%Terminal"
	var input = $"%Input"
	input.text = ""
	
	if not input_text.empty():
		term.bbcode_text +=executor.get_prefix()+input_text+"\n"
		var output = executor.execute(input_text)
		for line in output:
			term.bbcode_text += line+"\n"
		#get rid of any trailing new lines
		var terminal_scroll = $"%TerminalScroll"
		
		var v_scroll = $"%TerminalScroll".get_v_scrollbar()
		v_scroll.connect("changed",self,"_on_Terminal_resized",[v_scroll],CONNECT_ONESHOT)
		term.bbcode_text = term.bbcode_text.trim_suffix("\n")
		
		set_host()
	pass

func _on_ClearButton_pressed():
	var term =  $"%Terminal"
	term.bbcode_text = ""
	pass # Replace with function body.


func _on_Terminal_resized(v_scroll:VScrollBar):
	#If we're following the terminal, then keep scrolling down.
	if $"%FollowTerminal".pressed:
		v_scroll.value = v_scroll.max_value
	pass # Replace with function body.
