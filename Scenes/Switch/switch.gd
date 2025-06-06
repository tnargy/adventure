extends StaticBody2D

@export var active: bool = false
var can_interact: bool = false

signal state_changed(active: bool)


func _ready():
	if active:
		$AnimatedSprite2D.play("activated")
	else:
		$AnimatedSprite2D.play("deactivated")


func _process(_delta):
	if can_interact and Input.is_action_just_pressed("interact"):
		if active:
			$AnimatedSprite2D.play("deactivated")
		else:
			$AnimatedSprite2D.play("activated")
		active = !active
		state_changed.emit(active)
