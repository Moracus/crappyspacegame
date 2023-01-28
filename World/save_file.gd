extends Node

const score_file = "user://score.save"
var highscore = 0

func _ready():
	load_score()
func save_score(highscore):
	var file = File.new()
	file.open(score_file, File.WRITE)
	file.store_var(highscore)
	file.close()

func load_score():
	var file = File.new()
	if file.file_exists(score_file):
		file.open(score_file, File.READ)
		highscore= file.get_var()
		file.close()
	else:
		highscore= 0
