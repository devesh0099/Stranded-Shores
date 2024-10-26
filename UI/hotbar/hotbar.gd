extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _make_custom_tooltip(for_text):
	var tooltip = preload("res://UI/hotbar/tooltip.tscn").instantiate()
	tooltip.get_node(".").text = for_text
	return tooltip

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_heart_mouse_entered():
	_make_custom_tooltip("Heart")


func _on_logic_mouse_entered():
	_make_custom_tooltip("Logic")


func _on_creativity_mouse_entered():
	_make_custom_tooltip("Creativity")
