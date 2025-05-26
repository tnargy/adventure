extends Area2D


func _on_body_entered(body):
	if body.is_in_group("pushable") or body is Player:
		$AnimatedSprite2D.play("pressed")


func _on_body_exited(body):
	if body.is_in_group("pushable") or body is Player:
		$AnimatedSprite2D.play("unpressed")
