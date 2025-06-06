extends Marker2D

@export var target_score: int
var score: int

signal puzzle_solved
signal puzzle_failed

func incease_score():
	score += 1
	check_score()

func decease_score():
	score -= 1
	check_score()


func check_score():
	if score == target_score:
		puzzle_solved.emit()
	else:
		puzzle_failed.emit()
