extends Control

func _ready():
	update_food()
	Global.hunger_bar = self

var full = load("res://asserts/ui/food.png")
var half = load("res://asserts/ui/food-half.png")
var empty = load("res://asserts/ui/food-empty.png")

func _process(delta):
	pass

func update_food():
	if Global.hunger <= 0:
		$"1".texture = empty
		$"2".texture = empty
		$"3".texture = empty
		$"4".texture = empty
		$"5".texture = empty
	elif Global.hunger <= 10 and Global.hunger >= 0:
		$"1".texture = half
		$"2".texture = empty
		$"3".texture = empty
		$"4".texture = empty
		$"5".texture = empty
	elif Global.hunger <= 20 and Global.hunger >=10:
		$"1".texture = full
		$"2".texture = empty
		$"3".texture = empty
		$"4".texture = empty
		$"5".texture = empty
	elif Global.hunger <= 30 and Global.hunger >= 20:
		$"1".texture = full
		$"2".texture = half
		$"3".texture = empty
		$"4".texture = empty
		$"5".texture = empty
	elif Global.hunger <= 40 and Global.hunger >= 30:
		$"1".texture = full
		$"2".texture = full
		$"3".texture = empty
		$"4".texture = empty
		$"5".texture = empty
	elif Global.hunger <= 50 and Global.hunger >= 40:
		$"1".texture = full
		$"2".texture = full
		$"3".texture = half
		$"4".texture = empty
		$"5".texture = empty
	elif Global.hunger <= 60 and Global.hunger >= 50:
		$"1".texture = full
		$"2".texture = full
		$"3".texture = full
		$"4".texture = empty
		$"5".texture = empty
	elif Global.hunger <= 70 and Global.hunger >= 60:
		$"1".texture = full
		$"2".texture = full
		$"3".texture = full
		$"4".texture = half
		$"5".texture = empty
	elif Global.hunger <= 80 and Global.hunger >= 70:
		$"1".texture = full
		$"2".texture = full
		$"3".texture = full
		$"4".texture = full
		$"5".texture = empty
	elif Global.hunger <= 90 and Global.hunger >= 80:
		$"1".texture = full
		$"2".texture = full
		$"3".texture = full
		$"4".texture = full
		$"5".texture = half
	elif Global.hunger <= 100 and Global.hunger >= 90:
		$"1".texture = full
		$"2".texture = full
		$"3".texture = full
		$"4".texture = full
		$"5".texture = full
