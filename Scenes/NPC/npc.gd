extends StaticBody2D

@export var dialogue_lines: Array[String] = ["Hi!", "How are you?", "Bye!"]

var can_interact: bool = false
var current_line: int = 0

func _process(_delta):
	if can_interact and Input.is_action_just_pressed("interact"):
		if $CanvasLayer.visible and current_line >= len(dialogue_lines):
			current_line = 0
			$CanvasLayer.visible = false
			get_tree().paused = false
		else:
			%DialogueText.text = dialogue_lines[current_line]
			current_line += 1
			$CanvasLayer.visible = true
			if current_line >= len(dialogue_lines):
				%More.visible = false
			get_tree().paused = true
