extends Camera2D

var min_zoom = Vector2(0.5,0.5)
var max_zoom = Vector2(2,2)
var default_zoom = Vector2(1,1)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func get_input():
	if Input.is_action_just_released("zoom_in"):
		if not get_zoom() >= max_zoom:
			set_zoom((get_zoom()*Vector2(1.1,1.1)))
	elif Input.is_action_just_released("zoom_out"):
		if not get_zoom() <= min_zoom:
			set_zoom((get_zoom()*Vector2(0.9,0.9)))
	elif Input.is_action_just_pressed("zoom_reset"):
		set_zoom(default_zoom)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	get_input()
