extends Area2D
var bedroomScenePath : String = "res://Scenes/Room1.tscn"
var selected = false;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	selected = false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if selected:
		if Input.is_action_just_pressed("left_click"):
			get_tree().change_scene_to_file(bedroomScenePath)
			print("Going back home...")

func _on_mouse_exited() -> void:
	selected = false

func _on_mouse_entered() -> void:
	selected = true
