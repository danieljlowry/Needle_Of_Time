extends Node

# Player position (for managing playe rposition when switching scenes)
var player_position = Vector2.ZERO
var player_velocity = Vector2.ZERO
var player_spawn_position = Vector2.ZERO

# 
var current_scene = "res://assets/scenes/areas/area_1_past.tscn"

# Battery Charge
var max_charge := 10
var current_charge := 10
