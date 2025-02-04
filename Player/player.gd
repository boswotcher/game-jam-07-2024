extends CharacterBody2D

var movement_speed = 300.0
@onready var _animated_sprite = $AnimatedSprite2D

var starting_health = 100

var experience = 0.0
var current_level = 1
var next_level_exp = 10
var exp_needed_constant = 5

signal playerDeath
signal pause(v)
signal minute_timer(minutes)

var paused = false;
var facing = "east";

var entityType = "player"

var minutes_elapsed := 0.0
var seconds_elapsed := 0.0

func _ready():
	$Attributes.init(starting_health)
	_animated_sprite.play('idle')
	_on_gain_exp(0);

func _physics_process(delta):
	if(!paused):
		advance_timer(delta)
		movement()

func advance_timer(delta):
	seconds_elapsed += delta
	if seconds_elapsed >= 60.0:
		minutes_elapsed += 1.0;
		seconds_elapsed = 0.0;
		minute_timer.emit(minutes_elapsed)
	$GameTimerLabel.text = str(str(minutes_elapsed).pad_zeros(2).pad_decimals(0),":", str(seconds_elapsed).pad_zeros(2).pad_decimals(0))

func movement():
	var x_movement = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_movement = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	if x_movement > 0:
		facing = "east";
	elif x_movement < 0:
		facing = "west";
	elif y_movement > 0:
		facing = "south";
	elif y_movement < 0:
		facing = "north";
		
	$WeaponsController.set_dir(facing)
	
	var mov = Vector2(x_movement, y_movement)
	velocity = mov.normalized() * movement_speed
	var collided = move_and_slide();
	
	if(collided):
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i);
			if collision.get_collider().has_method("get_xp_value"):
				_on_gain_exp(collision.get_collider().get_xp_value());
				collision.get_collider().queue_free()
		
func on_hit(damage):
	$Attributes.takeDamage(damage)
	
func toggle_pause(pause: bool):
	paused = pause;
	$WeaponsController.toggle_pause(pause);
	
func _on_gain_exp(exp_value):
	experience += exp_value;
	if(experience >= next_level_exp):
		_level_up();
		experience -= next_level_exp;
		next_level_exp = current_level * exp_needed_constant
		
func _level_up():
	current_level+=1;
	$UpgradeModal.visible = true;
	pause.emit(true)
	
func _on_attributes_entity_death():
	playerDeath.emit();
	pass # Replace with function body.


func _on_upgrade_modal_modal_closed():
	pause.emit(false)
	pass # Replace with function body.
