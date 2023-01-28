extends KinematicBody2D
var playing = false
var Max_Speed= 400
var screen_size
var player = preload("res://Player/player.png")
var playerleft = preload("res://Player/playerLeft.png")
var playerright = preload("res://Player/playerRight.png")

func _ready():
	screen_size = get_viewport_rect().size
	$Ship/Exhaust.emitting = true
	hide()

var velocity
func _process(delta):
	if playing == true:
		show()
		$Ship.show()
		$CollisionShape2D.disabled = false
		var input_vector= Vector2.ZERO
		input_vector.x = Input.get_action_raw_strength("ui_right") - Input.get_action_raw_strength("ui_left")
		input_vector.y= Input.get_action_raw_strength("ui_down") - Input.get_action_raw_strength("ui_up")
		
		if input_vector != Vector2.ZERO:
			input_vector = input_vector.normalized()
			velocity = input_vector*Max_Speed
		else:
			velocity = Vector2.ZERO
		velocity = move_and_collide(velocity*delta)
		position.x = clamp(position.x,45,screen_size.x-45)
		position.y = clamp(position.y,37,screen_size.y-37)
		player_state(input_vector)
	else:
		$Ship.hide()
		$CollisionShape2D.disabled = true

func explosion():
	$Explosion.visible = true
	$Explosion/AnimationPlayer.play("explosion")
	$Explosion/AudioStreamPlayer.play()
func player_state(input_vector):
	if input_vector.x > 0:
		$Ship.texture = playerright
	elif input_vector.x < 0:
		$Ship.texture = playerleft
	elif input_vector.y < 0:
		$Ship.flip_v = false
		$Ship.texture = player
	elif input_vector.y > 0:
		$Ship.texture = player
	else:
		$Ship.texture = player
