extends StaticBody2D

var body_in = null
var timer 

func _ready():
	pass

func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		body_in = body 
		body_in.sinking_sand()
		create_timeer()

func create_timeer():
	timer = Timer.new()
	timer.wait_time = 1.0
	timer.timeout.connect(_on_timer_timeout)
	self.add_child(timer)
	timer.start()

func _on_timer_timeout():
	body_in.sinking_sand_effect()
	if timer != null:
		timer.start()


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		if timer != null:
			timer.queue_free()
			timer = null
		body_in = null
		
		
