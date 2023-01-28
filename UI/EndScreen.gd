extends CanvasLayer

onready var playing = true
func _ready():
	visible = false
func _process(delta):
	if playing == true:
		visible = false
func show_score(score,highscore):
	if playing == false:
		visible = true
		$ShowScore.text = "score:" + str(score)
		$HighScore.text = "highscore: "+ str(highscore)
