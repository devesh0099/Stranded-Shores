extends Control

func _process(_delta):
	var left = $Timer.get_time_left()
	var min = int(left/60)
	var sec = int(left - min * 60)
	var string_min = str(min)
	var string_sec = str(sec)
	var final_time = string_min + ":" + string_sec
	$Label.text = final_time

func _on_timer_timeout():
	Global.end_game()
