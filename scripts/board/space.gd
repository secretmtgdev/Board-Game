class_name Space extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $Collider/CollisionShape2D

var space_type: GameManager.SpaceType

func _ready() -> void:
	set_type(GameManager.SpaceType.BLUE)

func set_type(type: GameManager.SpaceType) -> void:
	space_type = type
	_set_sprite()
	
func _set_sprite() -> void:
	match space_type:
		GameManager.SpaceType.BLUE:
			sprite_2d.texture = ArtManager.SPACES["blue"]
		GameManager.SpaceType.RED:
			sprite_2d.texture = ArtManager.SPACES["red"]

func get_reward():
	match space_type:
		GameManager.SpaceType.BLUE:
			return 3
		GameManager.SpaceType.RED:
			return -3 
