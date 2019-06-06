extends Node2D

var safe_rect = Rect2(Vector2(80, 136), Vector2(432-80, 376-136))
var SPEED = 400
var RADIUS = 1

func _ready():
	generate_points()
	get_node("../noise/bar").set_value(get_node("../noise/bar").get_value() + 5)
	
func _physics_process(delta):
	var list_of_points = []
	
	var counter = 0
	
	for point in $points.get_children():
		
		list_of_points.append(point.position)
			
		counter += 1
	
	get_node("Line2D").points = PoolVector2Array(list_of_points)

	$points.radius += delta*SPEED
	modulate.a -= $points.radius*delta/(8 - RADIUS)
	SPEED -= delta*(SPEED/20)
	
	
func generate_points():
	
	var angle = 0 #MAX: 2PI
	var line_resolution = 32
	
	for i in range(line_resolution):
		
		var new_point = load("res://Prefabs/point.tscn").instance()
		$points.call_deferred("add_child", new_point)
		new_point.position = Vector2(1, 0).rotated(angle)

		angle += 2*PI/line_resolution
