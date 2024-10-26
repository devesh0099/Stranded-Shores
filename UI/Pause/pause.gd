extends Control

var paused = false

func _process(delta):
	pass

func _input(event):
	if Input.is_action_pressed("escape") and paused == false:
		self.show()
		paused = true
		get_tree().paused = true

func _on_resume_pressed():
	if paused:
		paused = false
		get_tree().paused = false
		self.hide()
