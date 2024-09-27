extends Node2D

@export_file("*.tscn") var next_level: String


func _on_goal_area_goal_cleared():
	$TransitionScreen.fade_to_black()


func _on_transition_screen_faded_to_black():
	hide()
	get_tree().change_scene_to_file(next_level)


func _on_transition_screen_started_fade_to_normal():
	show()
