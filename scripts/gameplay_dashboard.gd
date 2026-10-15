extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# General update to GUI
	GameManager.stats_changed.connect(_on_stats_changed)
	GameManager.time_changed.connect(_on_time_changed)
	GameManager.stats_changed.emit()
	GameManager.time_changed.emit()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_stats_changed(): # update stats GUI
	
	$Moods/Hunger/HBoxContainer/Value.text = str(int(GameManager.hunger))
	$Moods/Rest/HBoxContainer/Value.text = str(int(GameManager.rest))
	$Moods/Hygiene/HBoxContainer/Value.text = str(int(GameManager.hygiene))
	
	$Score/Happiness/HBoxContainer/Value.text = str(GameManager.happiness)
	$Score/Social/HBoxContainer/Value.text = str(GameManager.social_score)
	$Score/Study/HBoxContainer/Value.text = str(GameManager.study_score)

func _on_time_changed():
	$TimeOfDay/HBoxContainer/Value.text = str(GameManager.time_labels[GameManager.current_time])
