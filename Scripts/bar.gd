extends Node2D

var MAX_VALUE = 100
var VALUE = MAX_VALUE

var BAR_ZERO_X_VALUE = 60
var BAR_MAX_X_VALUE = 456
var BAR_VARIANCE = BAR_MAX_X_VALUE - BAR_ZERO_X_VALUE

func _ready():
	pass
	
func _process(delta):
	update_bar_position()
	VALUE -= delta*10

func get_value():
	return VALUE
	
func set_value(new_value):
	VALUE = new_value
	update_bar_position()
	
func update_bar_position():
	var percentage_value = VALUE/100
	var px_percentage = (percentage_value * BAR_VARIANCE)
	$moon.set_destination(Vector2(px_percentage + BAR_ZERO_X_VALUE, 40))