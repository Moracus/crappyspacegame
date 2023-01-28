extends Sprite

var speed = 800
var accn = 1
var playing = false

onready var initial_pos = position
onready var velocity = Vector2.ZERO
onready var direction  = Vector2(0,1)
func _process(delta):
	if playing == true:
		velocity = velocity.move_toward(direction*speed,accn)
		position.y += velocity.y*delta
		if position.y > get_viewport_rect().size.y:
			position.x = initial_pos.x
			position.y = 50

