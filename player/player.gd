extends CharacterBody2D


const SPEED = 50.0
@onready var anim = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.



func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var Xdirection = Input.get_axis("ui_left", "ui_right")
	var Ydirection = Input.get_axis("ui_up","ui_down")
	if Xdirection:
		velocity.x = Xdirection * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 100.0)
	if Ydirection:
		velocity.y = Ydirection * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, 100.0)
	if Xdirection or Ydirection:
		anim.play("Run")
	else:
		anim.play("Idle")
	if Xdirection == -1:
		anim.flip_h=true
	elif Xdirection == 1:
		anim.flip_h = false
	
	move_and_slide()
