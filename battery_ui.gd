extends Control

@onready var label = $Label
@onready var battery_texture = $"Percentage_Text"

func _ready():
	update_ui()
	
func update_ui():
	# Battery percentage
	var percent = GameState.current_charge * 10
	label.text = str(percent) + "%"
	
	# Change UI element to match player's remaining charge
	# Note: "Percentage_Text" is the name of the TextureRect, normally is: "$TextureRect.texture ..."
	# Another Note: I know this is bad practice, but it will work FOR NOW
	if percent == 100:
		battery_texture.texture = preload("res://assets/sprites/batteries/battery_100.png")
	elif percent == 90:
		battery_texture.texture = preload("res://assets/sprites/batteries/battery_90.png")
	elif percent == 80:
		battery_texture.texture = preload("res://assets/sprites/batteries/battery_80.png")
	elif percent == 70:
		battery_texture.texture = preload("res://assets/sprites/batteries/battery_70.png")
	elif percent == 60:
		battery_texture.texture = preload("res://assets/sprites/batteries/battery_60.png")
	elif percent == 50:
		battery_texture.texture = preload("res://assets/sprites/batteries/battery_50.png")
	elif percent == 40:
		battery_texture.texture = preload("res://assets/sprites/batteries/battery_40.png")
	elif percent == 30:
		battery_texture.texture = preload("res://assets/sprites/batteries/battery_30.png")
	elif percent == 20:
		battery_texture.texture = preload("res://assets/sprites/batteries/battery_20.png")
	elif percent == 10:
		battery_texture.texture = preload("res://assets/sprites/batteries/battery_10.png")
	else:
		battery_texture.texture = preload("res://assets/sprites/batteries/battery_0.png")
