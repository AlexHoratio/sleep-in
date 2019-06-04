extends Sprite

var destination

func _ready():
	destination = position
	
func _process(delta):
	position = position.linear_interpolate(destination, 0.1)

func set_destination(new_destination : Vector2 = Vector2(60, 40)):
	destination = new_destination