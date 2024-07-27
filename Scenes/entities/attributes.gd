extends Control

var speed = 100.0
var currentHealth = 0
var maxHealth = 0

signal entityDeath

func init(health):
	maxHealth = health
	currentHealth = maxHealth
	$healthBar.scale.x = (currentHealth as float/maxHealth as float)
	pass
	
func takeDamage(damage):
	if(currentHealth > 0):
		currentHealth -= damage;
	$healthBar.scale.x = (currentHealth as float/maxHealth as float)
	if(currentHealth <= 0):
		die();
	pass
	
func die():
	entityDeath.emit()
