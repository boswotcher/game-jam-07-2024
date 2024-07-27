extends CharacterBody2D

var movement_speed = 1000.0
var starting_health = 100

var experience = 0.0
var current_level = 1
var next_level_exp = 0
var exp_needed_constant = 5

signal playerDeath
signal levelUp

func _ready():
	$Attributes.init(starting_health)
	_on_gain_exp(0);

func _physics_process(delta):
	movement()
	
func movement():
	var x_movement = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_movement = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_movement, y_movement)
	velocity = mov.normalized() * movement_speed
	var collided = move_and_slide()
	
	if(collided):
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i);
			if collision.get_collider().has_method("get_xp_value"):
				_on_gain_exp(collision.get_collider().get_xp_value());
				collision.get_collider().queue_free()
		
func onCollision(damage):
	$Attributes.takeDamage(damage)
	
func _on_gain_exp(exp_value):
	experience += exp_value;
	if(experience >= next_level_exp):
		_level_up();
		experience -= next_level_exp;
		next_level_exp = current_level * exp_needed_constant
		
func _level_up():
	current_level+=1;
	levelUp.emit()
	
func _on_attributes_entity_death():
	playerDeath.emit();
	pass # Replace with function body.
