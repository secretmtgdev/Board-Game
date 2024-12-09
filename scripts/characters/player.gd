class_name Player extends Node2D

@onready var label: Label = $Label
@onready var label_timer: Timer = $LabelTimer

func _ready() -> void:
	label.hide()
	
func show_reward(rewardText: String) -> void:
	label.text = rewardText
	label.show()
	label_timer.start()
	
func _on_label_timer_timeout() -> void:
	label.hide()
