extends Control

@export_file("*.tscn") var title_scene: String


func _on_button_button_up():
	$TransitionScreen.fade_to_black()


func _on_transition_screen_faded_to_black():
	hide()
	get_tree().change_scene_to_file(title_scene)


func _on_transition_screen_started_fade_to_normal():
	show()
