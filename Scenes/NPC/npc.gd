extends StaticBody2D

var can_interact: bool = false

func _process(_delta):
	if can_interact:
		if Input.is_action_just_pressed("interact"):
			$CanvasLayer.visible = true
			$CanvasLayer/Dialog/Text.text = "Hello There"
	else:
		$CanvasLayer.visible = false