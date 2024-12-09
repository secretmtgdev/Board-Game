extends Node2D

@onready var player: Node2D = $Player
@onready var board_spaces: Node2D = $BoardSpaces
@onready var move_timer: Timer = $MoveTimer

var spaces
var spaces_to_move = 0
var current_space = GameManager.PREVIOUS_SPACE

func _ready() -> void:
	spaces = board_spaces.get_children()
	spaces_to_move = GameManager.CURRENT_SPACE + GameManager.NUMBER_OF_SPACES - GameManager.PREVIOUS_SPACE if GameManager.CURRENT_SPACE < GameManager.PREVIOUS_SPACE else GameManager.CURRENT_SPACE - GameManager.PREVIOUS_SPACE
	if !GameManager.NUMBER_OF_SPACES:
		GameManager.NUMBER_OF_SPACES = len(spaces)
	move_player()

func _process(_delta) -> void:
	if Input.is_action_just_pressed("roll_die"):
		roll_die()
		
func roll_die() -> void:
	GameManager.PREVIOUS_SPACE = GameManager.CURRENT_SPACE
	SceneManager.switch_to_scene("roll_die")

func move_player() -> void:
	player.position = spaces[current_space].position
	move_timer.start()

func _on_move_timer_timeout() -> void:
	player.position = spaces[current_space].position
	if spaces_to_move > 0:
		spaces_to_move -= 1
		current_space = (current_space + 1) % GameManager.NUMBER_OF_SPACES
		move_timer.start()
