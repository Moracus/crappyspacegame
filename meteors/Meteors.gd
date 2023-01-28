extends RigidBody2D

export var speed = 0
export var min_speed =100
export var max_speed =500
var accn = 1
var velocity = Vector2.ZERO
var direction = Vector2(0,1)
var rotation_rate = 0
var playing = false
export var min_rotationrate = -20
export var max_rotationrate = +20

signal hit
func _ready():
	randomize()
	gravity_scale = 0
	contact_monitor =  true
	contacts_reported = 1
	
	
func _physics_process(delta):
	if playing == true:
		rotation_degrees += rotation_rate*delta
		velocity = velocity.move_toward(direction*speed,accn)
		position.y += velocity.y*delta

		visible = true
	else:
		visible = false


	
func spawn():
	if playing == true:
		speed = rand_range(min_speed,max_speed)

		position.y = -100
		velocity = Vector2.ZERO
		linear_velocity = Vector2.ZERO
		rotation_rate = rand_range(min_rotationrate,max_rotationrate)
		var spawn_location = $MeteorPath/MeteorSpawnLocation
		spawn_location.offset = randi()
		position.x = spawn_location.position.x



func _on_VisibilityNotifier2D_screen_exited():
	spawn()



func _on_SmallMeteors_body_entered(body):
	emit_signal("hit")



