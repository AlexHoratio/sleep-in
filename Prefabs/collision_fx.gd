extends Node2D

var safe_rect = Rect2(Vector2(80, 136), Vector2(432-80, 376-136))
var SPEED = 200

func _ready():
	generate_points()
	
func _process(delta):
	var list_of_points = []
	
	for point in $points.get_children():
		if(not(safe_rect.has_point(point.global_position))):
			point.queue_free()
		else:
			list_of_points.append(point.position)
	
	get_node("Line2D").points = PoolVector2Array(list_of_points)

	$points.radius += delta*SPEED
	modulate.a -= delta*2
	SPEED -= delta*(SPEED/100)
	
func generate_points():
	
	var angle = 0 #MAX: 2PI
	var line_resolution = 32
	
	for i in range(line_resolution):
		
		var new_point = load("res://Prefabs/point.tscn").instance()
		$points.call_deferred("add_child", new_point)
		new_point.position = Vector2(1, 0).rotated(angle)

		angle += 2*PI/line_resolution
