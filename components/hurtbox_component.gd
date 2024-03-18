extends Area2D
class_name HurtboxComponent

signal hit

@export var healthComponent: HealthComponent
@export var myHitboxComponent: HitboxComponent


func _ready() -> void:
	area_entered.connect(on_area_entered)


func on_area_entered(otherArea: Area2D) -> void:
	if not otherArea is HitboxComponent:
		return
	
	if healthComponent == null:
		return
	
	var hitboxComponent = otherArea as HitboxComponent
	if hitboxComponent.get_parent() == get_parent():
		return
	
	if hitboxComponent.isEnemy and myHitboxComponent.isEnemy:
		return
	
	if healthComponent.dead:
		return
	
	healthComponent.damage(hitboxComponent.damage)
	
	hit.emit()

