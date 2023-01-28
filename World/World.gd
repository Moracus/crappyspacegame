extends ParallaxBackground
var score:int = 0
var playerdamaged = preload("res://Player/playerDamaged.png")
var retry_button = preload("res://UI/buttons/return.png")

onready var highscore = SaveFile.highscore
var speed = 800
var accn = 0.25
var playing = false
var initial_pos = offset
onready var velocity = Vector2.ZERO
onready var direction  = Vector2(0,1)
func _process(delta):
	if playing == true:
		velocity = velocity.move_toward(direction*speed,accn)
		scroll_offset.y += velocity.y*delta
		if score > highscore:
			highscore = score
			SaveFile.save_score(highscore)




func new_game():
	$Player/Pieces.is_crashed = false
	$Player/Pieces.emit_particles()
	velocity = Vector2.ZERO
	playing = true
	$EndScreen.playing = true
	$Player.playing = true
	$SmallMeteors.playing =true
	$SmallMeteors2.playing =true
	$SmallMeteors3.playing =true
	$BigMeteor.playing = true
	$BigMeteor2.playing = true
	
	$HUD/ScoreString.playing = true
	score = 0
	$Player.position = $StartPosition.position
	$StartTiimer.start()
	$HUD.update_score(score)
	$HUD.show_message("don't crash")
	$SmallMeteors.spawn()
	$SmallMeteors2.spawn()
	$SmallMeteors3.spawn()
	$BigMeteor.spawn()
	$BigMeteor2.spawn()

func show_endscreen():
	$HUD/ScoreString.playing = false
	
	$Player/Ship.texture = playerdamaged
	$ScoreTimer.stop()
	$EndScreen.playing = false
	$HUD.show_retry()
	$EndScreen.show_score(score,highscore)
	$HUD/Button.icon = retry_button
	
func game_over():
	$Player/Pieces/PiecesTimer.start()
	playing = false
	$Player.playing = false
	$Player.explosion()
	$Player/Pieces.is_crashed = true
	$Player/Pieces.emit_particles()

func _on_StartTiimer_timeout():
	$ScoreTimer.start()


func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_PiecesTimer_timeout():
	print("timer")
	$Player/Pieces.is_crashed = false
	$SmallMeteors.playing =false
	$SmallMeteors2.playing =false
	$SmallMeteors3.playing =false
	$BigMeteor.playing = false
	$BigMeteor2.playing = false
	show_endscreen()
