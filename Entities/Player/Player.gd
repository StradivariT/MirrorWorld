extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -350.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var gravity_direction = up_direction.y * -1

var facing_right: bool = true


func _physics_process(delta):
	handle_input(delta)
	handle_animation()


func handle_input(delta):
	if not is_on_floor():
		velocity.y += gravity * delta * gravity_direction
	
	if Input.is_action_just_pressed("player_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY * gravity_direction
	
	var direction = Input.get_axis("player_left", "player_right")
	
	velocity.x = 0
	if direction:
		velocity.x = direction * SPEED
	
	move_and_slide()


func handle_animation():
	if velocity == Vector2.ZERO:
		$AnimationPlayer.play("Idle")
		return
	
	if (velocity.x > 0 and not facing_right) or (velocity.x < 0 and facing_right):
		scale.x = -1 # This always reverses the scale, even if it's technically already -1
		facing_right = !facing_right
	
	if velocity.y != 0:
		if same_sign(gravity_direction, velocity.y):
			$AnimationPlayer.play("Jump Down")
			return
		else:
			$AnimationPlayer.play("Jump Up")
			return
	
	if velocity.x != 0:
		$AnimationPlayer.play("Run")


func same_sign(a: int, b: int) -> bool :
	return (a <= 0 and b <= 0) or (a > 0 and b > 0)
