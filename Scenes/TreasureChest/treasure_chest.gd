extends StaticBody2D

@export var chest_name: String
@export var reward: Resource

var can_interact: bool = false
var is_open: bool = false

func _ready():
	if SceneManager.opened_chests.has(chest_name):
		play_opened()

func _process(_delta):
	if can_interact and Input.is_action_just_pressed("interact"):
		if !is_open:
			open_chest()
			SceneManager.player_inventory[reward.name] += 1
			SceneManager.player_inventory_changed.emit()


func open_chest():
	play_opened()
	if reward:
		$Reward.texture = reward.image
		$Reward.visible = true
		var tween = create_tween()
		tween.tween_property($Reward, "position", Vector2(0, -12), 1.0)
		tween.tween_callback(func(): $Reward.visible = false)
		SceneManager.opened_chests.append(chest_name)


func play_opened():
	$AnimatedSprite2D.play("opened")
	is_open = true
