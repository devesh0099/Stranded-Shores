extends Camera2D

@export var min_zoom := 4.0
@export var max_zoom := 6.0
@export var zoom_factor := 0.2
@export var zoom_duration := 0.2
@export var dragsen := 1.0

const V2_2: Vector2 = Vector2.ONE * 2

const PAN_SPEED: int = 2000
const PAN_SMOOTHING: int = 8
const EDGE_PAN_THRESHOLD_MIN: Vector2 = Vector2(0.06, 0.12)
const EDGE_PAN_THRESHOLD_MAX: Vector2 = Vector2(0.01, 0.03)

var tween
var hand_cursor = load("res://asserts/cursor/hand_small_closed.png")
var arrow_cursor = load("res://asserts/cursor/pointer_c_shaded.png")

func _ready():
	#set_limit_camera()
	pass

var _zoom_level := 4.0:
	set (value):
		_zoom_level = value
	get:
		return _zoom_level

func _input(event):
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		Input.set_custom_mouse_cursor(hand_cursor)
		position -= event.relative * dragsen/zoom 
		
	if Input.is_action_just_released("drag"):
		Input.set_custom_mouse_cursor(arrow_cursor)
		#_remove_limit()

func set_limit_camera():
	var viewport_size = get_viewport_rect() 
	var x_offset = (viewport_size.size.x / zoom.x)/2
	var y_offset = (viewport_size.size.y / zoom.y)/2
	
	var vec_off = Vector2(x_offset,y_offset)
	
	var l_left = position.x - x_offset
	var l_top = position.y - y_offset
	var l_right = position.x + x_offset
	var l_bottom = position.y + y_offset
	print(l_left)
	print(l_top)
	print(l_right)
	print(l_bottom)
	
	set_limit(SIDE_LEFT,l_left)
	set_limit(SIDE_TOP,l_top)
	set_limit(SIDE_RIGHT,l_right)
	set_limit(SIDE_BOTTOM,l_bottom)

func _remove_limit():
	set_limit(SIDE_LEFT,-10000000)
	set_limit(SIDE_TOP,-10000000)
	set_limit(SIDE_RIGHT,10000000)
	set_limit(SIDE_BOTTOM,10000000)

func _set_zoom_level(value: float) -> void:
	tween =  get_tree().create_tween()
	_zoom_level = clamp(value, min_zoom, max_zoom)
	tween.tween_property(self,"zoom",Vector2(_zoom_level, _zoom_level),zoom_duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	#tween.interpolate_value(self,"zoom",zoom,Vector2(_zoom_level, _zoom_level),zoom_duration,tween.TRANS_SINE,tween.EASE_OUT)
	#tween.start()
	
func _unhandled_input(event):
	if event.is_action_pressed("zoom_in"):
		_set_zoom_level(_zoom_level - zoom_factor)
	if event.is_action_pressed("zoom_out"):
		_set_zoom_level(_zoom_level + zoom_factor)
