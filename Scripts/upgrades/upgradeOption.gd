extends Button


signal selected(upgrade_data)

var upgrade_data = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_upgrade_name(new_name):
	$Name.text = new_name;
	pass
	
func init_data(new_data):
	upgrade_data = new_data;
	pass

func _on_button_down():
	selected.emit(upgrade_data)
	pass # Replace with function body.
