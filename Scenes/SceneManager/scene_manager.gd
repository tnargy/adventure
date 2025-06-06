extends Node2D

var player_spawn_position: Vector2
var opened_chests: Array[StringName] = []
var player_inventory: Dictionary = { "Coin" = 0, "Scroll" = 0 }

signal player_inventory_changed

func _ready():
	player_inventory_changed.emit()
