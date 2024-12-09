extends Node

const DIE_ROLLER = preload("res://scenes/dice/die_roller.tscn")
const SPACE = preload("res://scenes/Board/space.tscn")

const SPACE_SIZE:int = 16
var PREVIOUS_SPACE = 0
var CURRENT_SPACE = 0
var NUMBER_OF_SPACES = 0

enum GameDifficulty {
	EASY,
	MEDIUM,
	HARD
}

enum SpaceType {
	BLUE,
	RED
}

var CUR_DIFFICULTY = GameDifficulty.EASY
var CUR_BOARD = "board_a"

func _ready() -> void:
	load_current_world()
	SignalManager.die_hit_done.connect(load_current_world)

func load_current_world() -> void:
	SceneManager.switch_to_scene(CUR_BOARD)

func set_difficulty(newDifficulty: GameDifficulty) -> void:
	CUR_DIFFICULTY = newDifficulty
