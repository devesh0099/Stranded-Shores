extends Control

var empty = load("res://asserts/ui/bag-empty.png")
var full = load("res://asserts/ui/bag_full.png")

func _ready():
	update_bag()
	Global.inv_bar = self

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_bag():
	if Global.player_inv_cap == Global.max_capacity:
		$"1".texture = empty
		$"2".texture = empty
		$"3".texture = empty
		$"4".texture = empty
		$"5".texture = empty
		$"6".texture = empty
	elif Global.player_inv_cap == Global.max_capacity - 4:
		$"1".texture = full
		$"2".texture = empty
		$"3".texture = empty
		$"4".texture = empty
		$"5".texture = empty
		$"6".texture = empty
	elif Global.player_inv_cap == Global.max_capacity - 8:
		$"1".texture = full
		$"2".texture = full
		$"3".texture = empty
		$"4".texture = empty
		$"5".texture = empty
		$"6".texture = empty
	elif Global.player_inv_cap == Global.max_capacity - 12:
		$"1".texture = full
		$"2".texture = full
		$"3".texture = full
		$"4".texture = empty
		$"5".texture = empty
		$"6".texture = empty
	elif Global.player_inv_cap == Global.max_capacity - 16:
		$"1".texture = full
		$"2".texture = full
		$"3".texture = full
		$"4".texture = full
		$"5".texture = empty
		$"6".texture = empty
	elif Global.player_inv_cap == Global.max_capacity - 20:
		$"1".texture = full
		$"2".texture = full
		$"3".texture = full
		$"4".texture = full
		$"5".texture = full
		$"6".texture = empty
	elif Global.player_inv_cap == Global.max_capacity - 24:
		$"1".texture = full
		$"2".texture = full
		$"3".texture = full
		$"4".texture = full
		$"5".texture = full
		$"6".texture = full

func unlock_4():
	$"4".show()
	update_bag()

func unlock_5():
	$"5".show()
	update_bag()

func unlock_6():
	$"6".show()
	update_bag()

func update_wood():
	$wood/Label.text = str(Global.player.wood)

func update_stone():
	$stone/Label.text = str(Global.player.stone)
