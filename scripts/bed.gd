extends Area2D

var selected = false;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	selected = false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if selected:
		if Input.is_action_just_pressed("left_click"):
			print("Bed is clicked!")

func _on_mouse_exited() -> void:
	selected = false

func _on_mouse_entered() -> void:
	selected = true
