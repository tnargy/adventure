extends StaticBody2D

@export var number_of_buttons_needed := 1

var buttons_pressed_counter := 0

func _on_puzzle_button_pressed():
	buttons_pressed_counter += 1
	if number_of_buttons_needed <= buttons_pressed_counter:
		visible = false
		$CollisionShape2D.set_deferred("disabled", true)
	


func _on_puzzle_button_unpressed():
	buttons_pressed_counter -= 1
	if number_of_buttons_needed > buttons_pressed_counter:
		visible = true
		$CollisionShape2D.set_deferred("disabled", false)
