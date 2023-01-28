extends Area2D

var speed = 500

func _physics_process(delta):
		position.y -= speed *delta




func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
