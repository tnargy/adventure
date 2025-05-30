extends Area2D

signal pressed
signal unpressed

var bodies_on_top: int = 0


func _on_body_entered(body):
	bodies_on_top += 1
	if body.is_in_group("pushable") or body is Player:
		if bodies_on_top == 1:
			$AnimatedSprite2D.play("pressed")
			pressed.emit()


func _on_body_exited(body):
	bodies_on_top -= 1
	if body.is_in_group("pushable") or body is Player:
		if bodies_on_top == 0:
			$AnimatedSprite2D.play("unpressed")
			unpressed.emit()
