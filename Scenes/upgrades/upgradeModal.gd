extends Control

const debug = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_skip_button_down():
	cleanup();
	pass # Replace with function body.

func cleanup():
	#do all the post-select clean up
	visible = false;
	pass


func _on_upgrade_list_option_selected(option_data):
	#apply upgrade to character
	if(debug):
		print_debug(str("option_data:", option_data));
	cleanup();
	pass # Replace with function body.
