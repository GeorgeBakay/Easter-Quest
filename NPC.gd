extends CharacterBody2D
enum {
	IDLE,
	MOVE,
	NEW_DIR
}

const SPEED = 10.0
var cuurent_state = IDLE
var dir = Vector2.RIGHT
@onready var anim = $AnimatedSprite2D
func _ready():
	randomize()
	$Timer.start()

func _process(delta):
	
	match cuurent_state:
		IDLE:
			anim.play("Idle")
			pass
		NEW_DIR:
			anim.play("Idle")
			dir = choose([Vector2.RIGHT,Vector2.UP,Vector2.LEFT,Vector2.DOWN])
			pass
		MOVE:
			anim.play("Run")
			move(delta)
	
	move_and_slide()
	
func move(delta):
	position += dir * delta * SPEED
	if dir == Vector2.LEFT:
		anim.flip_h = true
	elif dir == Vector2.RIGHT:
		anim.flip_h = false
func choose(array):
	array.shuffle()
	return array.front()

func _on_timer_timeout():
	
	$Timer.wait_time = choose([0.5,1,1.5])
	cuurent_state = choose([IDLE,MOVE,NEW_DIR])
	pass # Replace with function body.
