extends CanvasLayer

signal start_game

func _ready():
	pass
	
func show_message(text):
	$message.text = text
	$message.show()
	
func show_game_over():
	show_message("Game Over")
	$message.show()
	$restart.show()
	
func update_score(score):
	$ScoreNum.text = str(score)

func _on_restart_pressed():
	$restart.hide()
	$message.hide()
	emit_signal("start_game")
