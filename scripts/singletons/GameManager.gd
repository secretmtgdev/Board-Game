extends Node

const DIE_ROLLER = preload("res://scenes/dice/die_roller.tscn")
const SPACE_SIZE:int = 32

enum GameDifficulty {
	EASY,
	MEDIUM,
	HARD
}

var CUR_DIFFICULTY = GameDifficulty.EASY
var CUR_WORLD = "World1"

func _ready() -> void:
	SignalManager.die_hit_done.connect(load_current_world)

func load_current_world() -> void:
	SceneManager.switch_to_scene(CUR_WORLD)

func set_difficulty(newDifficulty: GameDifficulty) -> void:
	CUR_DIFFICULTY = newDifficulty
