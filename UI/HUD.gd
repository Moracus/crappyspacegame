extends CanvasLayer

signal start_game

func show_message(text):
	$Message.text =text
	$Message.show()
	$MessageTimer.start()
	
func show_retry():
	$Button.show()
func update_score(score):
	$ScoreString/Score.text = str(score)

func _on_MessageTimer_timeout():
	$Message.hide()
func _on_Button_pressed():
	$Button.hide()
	emit_signal("start_game")
