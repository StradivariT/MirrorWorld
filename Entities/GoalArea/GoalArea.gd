extends Area2D

const PLAYERS_REQUIRED_IN_GOAL: int = 2

var players_in_goal: int = 0

signal goal_cleared


func _on_body_entered(body):
	players_in_goal += 1
	
	if players_in_goal == PLAYERS_REQUIRED_IN_GOAL:
		goal_cleared.emit()


func _on_body_exited(body):
	players_in_goal -= 1
