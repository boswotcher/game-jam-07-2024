extends Node2D

var player
var speed = 100.0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Attributes.init(5)
	pass # Replace with function body.

func set_player(playernode):
	player= playernode;
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var velocity = global_position.direction_to(player.global_position);
	var d = velocity * speed * delta;
	global_position += d;
	pass

