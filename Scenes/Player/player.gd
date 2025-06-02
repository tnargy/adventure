class_name Player
extends CharacterBody2D

@onready var animations = $AnimatedSprite2D

@export var hp: int = 10
@export var move_speed: float = 60
@export var push_strength: float = 300

var direction: Vector2


# Called when the node enters the scene tree for the first time.
func _ready():
	if SceneManager.player_spawn_position != Vector2.ZERO:
		position = SceneManager.player_spawn_position


func _input(_event):
	direction = Input.get_vector(
		"move_left","move_right",
		"move_up","move_down")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	move_player()	
	push_blocks()
	move_and_slide()


func move_player():
	velocity = direction * move_speed	
	if velocity.x > 0:
		$AnimatedSprite2D.play("move_right")
		$InteractArea.position = Vector2(5,2)
	elif velocity.x < 0:
		$AnimatedSprite2D.play("move_left")
		$InteractArea.position = Vector2(-5,2)
	elif velocity.y > 0:
		$AnimatedSprite2D.play("move_down")
		$InteractArea.position = Vector2(0,8)
	elif velocity.y < 0:
		$AnimatedSprite2D.play("move_up")
		$InteractArea.position = Vector2(0,-4)
	else:
		$AnimatedSprite2D.stop()


func push_blocks():
	var collision: KinematicCollision2D = get_last_slide_collision()
	if collision:
		var collision_node = collision.get_collider()
		if collision_node.is_in_group("pushable"):
			var collision_normal: Vector2 = collision.get_normal()
			collision_node.apply_central_force(-collision_normal * push_strength)


func _on_interact_area_body_entered(body):
	if body.is_in_group("interactable"):
		body.can_interact = true


func _on_interact_area_body_exited(body):
	if body.is_in_group("interactable"):
		body.can_interact = false
