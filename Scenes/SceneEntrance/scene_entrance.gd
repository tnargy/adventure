extends Area2D

@export var next_scene: String

func _on_body_entered(body):
	if body is Player:
		get_tree().change_scene_to_file.call_deferred(next_scene)
