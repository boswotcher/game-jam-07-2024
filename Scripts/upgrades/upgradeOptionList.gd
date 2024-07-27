extends Control

var upgradeOption = preload("res://Scenes/upgrades/upgradeOption.tscn")

signal option_selected(option_data);

# Called when the node enters the scene tree for the first time.
func _ready():
	loadOptions()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func loadOptions():
	for v in 3:
		var new_option = upgradeOption.instantiate();
		new_option.set_upgrade_name(str("option ",v));		
		new_option.connect("selected", _option_selected);
		add_child(new_option)
	pass
		


func _on_button_skip_button_down():
	#cleanup modal
	visible = false;
	pass # Replace with function body.
	
func _option_selected(option_data):
	option_selected.emit(option_data);
	pass
