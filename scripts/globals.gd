extends Node

var bestiary_active: bool = false
var max_health: int = 5
var health: int = 5

func change_health(amount: int) -> void:
	health += amount
	if health > max_health:
		health = max_health
