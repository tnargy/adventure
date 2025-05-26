class_name Player
extends CharacterBody2D

@onready var animations = $AnimatedSprite2D

@export var hp: int = 10
@export var move_speed: float = 60

var direction: Vector2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(_event):
	direction = Input.get_vector(
		"move_left","move_right",
		"move_up","move_down")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
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
	
	move_and_slide()
