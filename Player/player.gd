extends CharacterBody2D

var movement_speed = 200.0
var starting_health = 100

var experience = 0.0
var level = 1

func _ready():
	$Attributes.init(starting_health)

func _physics_process(delta):
	movement()
	
func movement():
	var x_movement = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_movement = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_movement, y_movement)
	velocity = mov.normalized() * movement_speed
	move_and_slide()
	

