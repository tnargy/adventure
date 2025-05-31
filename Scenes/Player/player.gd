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
	velocity = direction * move_speed	
	if velocity.x > 0:
		$AnimatedSprite2D.play("move_right")
	elif velocity.x < 0:
		$AnimatedSprite2D.play("move_left")
	elif velocity.y > 0:
		$AnimatedSprite2D.play("move_down")
	elif velocity.y < 0:
		$AnimatedSprite2D.play("move_up")
	else:
		$AnimatedSprite2D.stop()
		
	var collision: KinematicCollision2D = get_last_slide_collision()
	if collision:
		var collision_node = collision.get_collider()
		if collision_node.is_in_group("pushable"):
			var collision_normal: Vector2 = collision.get_normal()
			collision_node.apply_central_force(-collision_normal * push_strength)
	
	move_and_slide()
