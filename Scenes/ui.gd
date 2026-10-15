extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.time_changed.connect(_on_time_changed)
	GameManager.dialogue_free_time_start.connect(_on_dialogue_free_time_start)
	GameManager.dialogue_main_start.connect(_on_dialogue_main_start)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_game_start_start_game() -> void:
	$MainDialogue.action()
	$GameplayDashboard.visible = true
	
func _on_time_changed() -> void:
	#$MainDialogue.action()
	pass

func _on_dialogue_free_time_start() -> void:
	$FreeTimeDialogue.action()
	
func _on_dialogue_main_start() -> void:
	$MainDialogue.action()
	
func _on_main_dialogue_dialogue_ended() -> void:
	pass



func _on_free_time_dialogue_dialogue_ended() -> void:
	pass
