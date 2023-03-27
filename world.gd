extends Node2D
var score

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_kill_body_entered(body):
	_on_hurtbox_body_entered(body)
	
	
func new_game():
	$enemy/AnimatedSprite.play("walk")	
	$enemy.speed = 50
	$coin.show()
	score = 0
	$player.show()
	$player/CollisionShape2D.disabled = false
	$player.position.x = 30
	$player.position.y = 200
	$HUD.update_score(score)
	$HUD/message.hide()


func _on_win_body_entered(body):
	$player.hide()
	$HUD.show_message("YOU WIN!")
	$HUD/restart.show()


func _on_hurtbox_body_entered(body):
	$player.hide()
	$player/CollisionShape2D.set_deferred("disabled", true)
	score = 0
	$HUD.update_score(score)
	$HUD.show_game_over()


func _on_coin_body_entered(body):
	$coin.hide()
	score += 1
	$HUD.update_score(score)
