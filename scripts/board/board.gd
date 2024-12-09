extends Node2D

@onready var player: Player = $Player
@onready var board_spaces: Node2D = $BoardSpaces
@onready var move_timer: Timer = $MoveTimer

var spaces: Array[Node]
var spaces_to_move = 0
var current_space = GameManager.PREVIOUS_SPACE
var red_spaces_prime = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53]

func _ready() -> void:
	spaces = board_spaces.get_children()
	spaces_to_move = GameManager.CURRENT_SPACE + GameManager.NUMBER_OF_SPACES - GameManager.PREVIOUS_SPACE if GameManager.CURRENT_SPACE < GameManager.PREVIOUS_SPACE else GameManager.CURRENT_SPACE - GameManager.PREVIOUS_SPACE
	player.position = spaces[current_space].position
	mark_non_blue_spaces()
	if !GameManager.NUMBER_OF_SPACES:
		GameManager.NUMBER_OF_SPACES = len(spaces)
	
	if GameManager.PREVIOUS_SPACE != GameManager.CURRENT_SPACE:
		move_player()
		
func mark_red_spaces():
	for space in red_spaces_prime:
		(spaces[space] as Space).set_type(GameManager.SpaceType.RED)

func mark_non_blue_spaces():	
	mark_red_spaces()

func _process(_delta) -> void:
	if Input.is_action_just_pressed("roll_die"):
		roll_die()
		
func roll_die() -> void:
	GameManager.PREVIOUS_SPACE = GameManager.CURRENT_SPACE
	SceneManager.switch_to_scene("roll_die")

func move_player() -> void:
	move_timer.start()

func _on_move_timer_timeout() -> void:
	player.position = spaces[current_space].position
	if spaces_to_move > 0:
		spaces_to_move -= 1
		current_space = (current_space + 1) % GameManager.NUMBER_OF_SPACES
		move_timer.start()
	else:
		handle_space()
		
func handle_space() -> void:
	var space: Space = spaces[current_space]
	var reward = space.get_reward()
	player.show_reward(str(reward) if reward < 0 else "+%d" % reward)
