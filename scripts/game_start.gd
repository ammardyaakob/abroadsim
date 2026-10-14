extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$DialogueActionable2D.action()

signal start_game

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_gamestart_dialogue_ended() -> void:
	start_game.emit()
	# start Game
	
