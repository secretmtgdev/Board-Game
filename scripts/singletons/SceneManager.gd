extends Node

const SCENES = {
	"DieHit": preload("res://scenes/dice/die_hit_qte.tscn")
}

func switch_to_scene(scene_to_load: String) -> void:
	call_deferred("_load_scene", scene_to_load)

func _load_scene(scene_to_load: String) -> void:
	if scene_to_load not in SCENES:
		return
		
	get_tree().change_scene_to_packed(SCENES[scene_to_load])
