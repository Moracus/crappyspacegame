extends Label

onready var playing = false

func _process(delta):
	if playing == true:
		visible = true
	else:
		visible = false
