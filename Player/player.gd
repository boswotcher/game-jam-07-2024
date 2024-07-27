extends CharacterBody2D

var movement_speed = 1000.0
var starting_health = 100

var experience = 0.0
var level = 1

signal playerDeath

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
	
func onCollision(damage):
	$Attributes.takeDamage(damage)


func _on_attributes_entity_death():
	playerDeath.emit();
	pass # Replace with function body.
