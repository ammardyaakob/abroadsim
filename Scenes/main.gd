extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_game_start_start_game() -> void:
	
	change_world(preload("res://Scenes/Room1.tscn"))
	pass # Replace with function body.
	
func change_world(scene : PackedScene) -> void:
	var worldNode : Node = get_node("World") 
	for child in worldNode.get_children():
		child.queue_free()
	worldNode.get_tree()
	worldNode.add_child(scene.instantiate())
