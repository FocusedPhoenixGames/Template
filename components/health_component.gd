extends Node
class_name HealthComponent

signal died
signal health_changed

@export var maxHealth: int = 10

var currentHealth: int
var dead: bool = false


func _ready() -> void:
	currentHealth = maxHealth


func damage(damageAmount: int) -> void:
	currentHealth = clamp(currentHealth - damageAmount, 0, maxHealth)
	health_changed.emit()
	
	Callable(check_death).call_deferred()


func heal(healAmount: int) -> void:
	damage(-healAmount)


func check_death() -> void:
	if currentHealth == 0:
		dead = true
		owner.queue_free()
		died.emit()
