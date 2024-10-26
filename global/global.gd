extends Node

var wood := 0
var stone := 0

var world
var tech_tree
var tech_tree_showed:= false
var player
var home

var max_capacity = 12
var player_inv_cap = 12

var hunger := 30

var hunger_bar
var inv_bar

var craft_stage:=0
var clist_stage := 0
var list = ["Platform","Sail","Paddle"]
var c_list = ["Signal_Platform","Flammable_Material","Trigger"]
var abilities = {
	"Speed":0,
	"Hunger":0,
	"Capacity":0
}

var win = "res://UI/winandlose/win.tscn"
var lose = "res://UI/winandlose/lose.tscn"

func receipe_unlock(stage):
	match stage:
		"Signal_Platform":
			tech_tree.unlock_signal()
		"Flammable_Material":
			tech_tree.unlock_flammable()
		"Trigger":
			tech_tree.unlock_trigger()


func inc_signal_stats(stage):
	if stage in c_list:
		c_list.erase(stage)
		clist_stage += 1
		if clist_stage >= 3:
			get_tree().change_scene_to_file(win)
		return true
	return false

func inc_raft_stage(stage):
	if stage in list:
		list.erase(stage)
		craft_stage+=1
		if craft_stage >= 3:
			#world.queue_free()
			get_tree().change_scene_to_file(win)
		return true
	return false

func player_dead():
	get_tree().change_scene_to_file(lose)
	#world.queue_free()

func end_game():
	get_tree().change_scene_to_file(lose)

func hunger_update():
	if hunger > 0:
		hunger -= 10
	hunger_bar.update_food()
	hunger_check()

func inv_update():
	inv_bar.update_bag()
	inv_bar.update_stone()
	inv_bar.update_wood()

func hunger_check():
	if hunger <= 0:
		player_dead()

func ability_handler(ability):
	var updated = abilities[ability]
	if updated >= 3:
		return 4
	match ability:
		"Speed":
			inc_speed_ability()
			abilities[ability] += 1
			return abilities[ability]
		"Hunger":
			dec_hunger()
			abilities[ability] += 1
			return abilities[ability]
		"Capacity":
			inc_capacity_ability()
			abilities[ability] += 1 
			return abilities[ability]

func inc_speed_ability():
	player.speed += int(player.speed*0.3)
	print("Speed now is: ", player.speed)
	
func inc_capacity_ability():
	max_capacity += 4
	player_inv_cap += 4 
	if max_capacity == 16:
		inv_bar.unlock_4()
	elif max_capacity == 20:
		inv_bar.unlock_5()
	elif max_capacity == 24:
		inv_bar.unlock_6()
	print("Capacity now is: ", player_inv_cap)

func dec_hunger():
	var time = player.timer.wait_time
	player.timer.stop()
	time += int(time * 0.1)
	player.timer.wait_time = time
	print("Timer set to: ", time)
	player.timer.start()

func _input(event):
	if Input.is_action_pressed("techtree") and tech_tree_showed == false and home.ruined == false:
		tech_tree.update_stone_food()
		tech_tree.show()
		tech_tree_showed = true
	elif Input.is_action_pressed("techtree") and tech_tree_showed == true and home.ruined == false:
		tech_tree.update_stone_food()
		tech_tree.hide()
		tech_tree_showed = false
