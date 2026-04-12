extends CharacterBody2D

@export var speed = 10.0
@export var jump_power = 10.0

var speed_multiplier = 30.0
var jump_multiplier = -30.0
var direction = 0
#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0

# ==================================================================================================
# BASIC MOVEMENT FUNCTION
# ==================================================================================================


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_power * jump_multiplier

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed * speed_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)

	move_and_slide()

	
# ==================================================================================================
# SWITCH SCENE FUNCTIONALITY
# ==================================================================================================

func  _process(delta):
	if Input.is_action_just_pressed("switch_scene"):
		switch_scene()

func switch_scene():
	
	# Get player's position & velocity
	GameState.player_position = global_position
	GameState.player_velocity = velocity
	
	# Case 1: Scene 1 (Present) --> Scene 2 (Past)
	if GameState.current_scene == "res://assets/scenes/areas/area_1.tscn":
		print("Traveling to the Past!")
		GameState.current_scene = "res://assets/scenes/areas/area_1_past.tscn"
	# Case 2: Scene 2 (Past) --> Scene 1 (Present)
	else:
		print("Traveling back to the Present!")
		GameState.current_scene = "res://assets/scenes/areas/area_1.tscn"
	get_tree().change_scene_to_file(GameState.current_scene)
	
func _ready():
	GameState.player_spawn_position = global_position # Gets player's spawn position & assigns it to global
	global_position = GameState.player_position
	velocity = GameState.player_velocity
