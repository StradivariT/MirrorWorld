extends Control

@export_file("*.tscn") var start_level: String 


func _on_start_button_button_up():
	$TransitionScreen.fade_to_black()


func _on_exit_button_button_up():
	get_tree().quit()


func _on_transition_screen_faded_to_black():
	hide()
	get_tree().change_scene_to_file(start_level)


func _on_transition_screen_started_fade_to_normal():
	show()
