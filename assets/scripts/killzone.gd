extends Area2D


@onready var timer = $Timer

func _on_body_entered(body):
	# Ensures that killzone is only triggered by the player
	# Player > Node tab on the right > groups (for future context)
	if body.is_in_group("player"):
		print("You Died!")
		
		# Reset the player's position in level
		body.global_position = GameState.player_spawn_position

func _on_timer_timeout():
	get_tree().reload_current_scene()
