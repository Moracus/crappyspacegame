extends Node2D


onready var pieces = [$piece1, $piece2, $piece3, $piece4, $piece5, $piece6, $piece7]
onready var is_crashed = false

func _ready():
	for piece in pieces:
		piece.emitting = false
		piece.lifetime = 1

func emit_particles():
	if is_crashed == true:
		show()
		for piece in pieces:
			piece.emitting = true
			piece.one_shot = true
	elif is_crashed == false:
		hide()
		for piece in pieces:
			piece.emitting = false
			piece.one_shot = false
