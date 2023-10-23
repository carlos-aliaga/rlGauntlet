extends CharacterBody2D

const SPEED = 50.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var current_animation = "Walk"
var angle = 0
var input_dir

func _process(delta):		
	input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	animacion()
	
	velocity = input_dir.normalized() * SPEED	
	
	move_and_slide()
	
	#print(current_animation + str(angle))
	
func animacion():
	if input_dir.length() != 0:
		angle = wrapi(int(input_dir.angle() / (PI/4)), 0, 8)
		$AnimationPlayer.play(current_animation + str(angle))
	else:
		$AnimationPlayer.stop(true)
