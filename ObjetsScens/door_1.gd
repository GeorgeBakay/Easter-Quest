extends StaticBody2D

var is_open = false
var is_in_area = false
@onready var this_sprite = $Sprite2D
@onready var this_collision = $CollisionShape2D
@onready var anim  = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	is_open = false
	is_in_area = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass

func _input(event):
	if event is InputEventKey and event.pressed:
		if is_in_area and event.keycode == KEY_F:
			if not is_open:
				this_sprite.visible = false
				this_collision.disabled = true
				is_open = true
			else:
				this_sprite.visible = true
				this_collision.disabled = false
				is_open = false
			
func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		if body.name =="Player":
			anim.visible = true
			anim.play("Run")
			is_in_area = true
		else:
			this_sprite.visible = false
			this_collision.set_deferred("disabled",true)
			
			is_open = true
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	if body is CharacterBody2D:
		if body.name == "Player":
			anim.visible = false
			anim.stop()
			is_in_area = false
		else:
			this_sprite.visible = true
			this_collision.set_deferred("disabled",false)
			is_open = false
	pass # Replace with function body.
