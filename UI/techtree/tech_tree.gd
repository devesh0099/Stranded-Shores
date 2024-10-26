extends Control

var full = load("res://asserts/ui/point_full.png")
var empty = load("res://asserts/ui/point.png")

var done = load("res://asserts/ui/done.png")

func _play_sfx():
	$AudioStreamPlayer.play()

func _ready():
	update_stone_food()
	Global.tech_tree = self

func update_stone_food():
	$wood/Label.text = str(Global.wood)
	$stone/Label.text = str(Global.stone)

func pass_checks(about):
	match about:
		"Speed":
			if Global.wood >= 4 and Global.stone >= 4:
				return true
			else:
				return false
		"Hunger":
			if Global.wood >= 4 and Global.stone >= 2:
				return true
			else:
				return false
		"Capacity":
			if Global.wood >= 0 and Global.stone >= 4:
				return true
			else:
				return false
		"Platform":
			if Global.wood >= 12 and Global.stone >= 12:
				return true
			else:
				return false
		"Sail":
			if Global.wood >= 8 and Global.stone >= 8:
				return true
			else:
				return false
		"Paddle":
			if Global.wood >= 16 and Global.stone >= 4:
				return true
			else:
				return false

func _on_boot_button_pressed():
	if !pass_checks("Speed"):
		return
	var limit = Global.ability_handler("Speed")
	match limit:
		1:
			$"boot/1".texture = full
			Global.wood -= 4
			Global.stone -= 4
			update_stone_food()
			_play_sfx()
		2:
			$"boot/2".texture = full
			Global.wood -= 4
			Global.stone -= 4
			update_stone_food()
			_play_sfx()
		3:
			$"boot/3".texture = full
			Global.wood -= 4
			Global.stone -= 4
			update_stone_food()
			_play_sfx()

func _on_food_button_pressed():
	if !pass_checks("Hunger"):
		return
	var limit = Global.ability_handler("Hunger")
	match limit:
		1:
			$"food/1".texture = full
			Global.wood -= 4
			Global.stone -= 2
			update_stone_food()
			_play_sfx()
		2:
			$"food/2".texture = full
			Global.wood -= 4
			Global.stone -= 2
			update_stone_food()
			_play_sfx()
		3:
			$"food/3".texture = full
			Global.wood -= 4
			Global.stone -= 2
			update_stone_food()
			_play_sfx()

func _on_capacity_button_pressed():
	if !pass_checks("Capacity"):
		return
	var limit = Global.ability_handler("Capacity")
	match limit:
		1:
			$"capacity/1".texture = full
			Global.wood -= 0
			Global.stone -= 4
			update_stone_food()
			_play_sfx()
		2:
			$"capacity/2".texture = full
			Global.wood -= 0
			Global.stone -= 4
			update_stone_food()
			_play_sfx()
		3:
			$"capacity/3".texture = full
			Global.wood -= 0
			Global.stone -= 4
			update_stone_food()
			_play_sfx()


func _on_platform_button_pressed():
	if pass_checks("Platform") == false:
		return
	$RaftPlatform/Platform_button.icon = done
	var state = Global.inc_raft_stage("Platform")
	if state == true:
		Global.stone -= 12
		Global.wood -= 12
		update_stone_food()
		_play_sfx()

func _on_sail_button_pressed():
	if pass_checks("Sail") == false:
		return
	$RaftSail/Sail_button.icon = done
	var state = Global.inc_raft_stage("Sail")
	if state == true:
		Global.wood -= 8
		Global.stone -= 8
		update_stone_food()
		_play_sfx()

func _on_paddling_button_pressed():
	if pass_checks("Paddle") == false:
		return
	$Raftsteering/Paddling_button.icon = done
	var state = Global.inc_raft_stage("Paddle")
	if state == true:
		Global.wood -= 16
		Global.stone -= 4
		update_stone_food()
		_play_sfx()
