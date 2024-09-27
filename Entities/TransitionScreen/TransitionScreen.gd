extends CanvasLayer

signal faded_to_black
signal started_fade_to_normal


func _ready():
	$AnimationPlayer.play("fade_to_normal")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_to_normal":
		hide()
	else:
		faded_to_black.emit()


func fade_to_black():
	show()
	$AnimationPlayer.play("fade_to_black")


func _on_animation_player_animation_started(anim_name):
	if anim_name == "fade_to_normal":
		started_fade_to_normal.emit()
