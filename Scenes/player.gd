extends RigidBody2D

#PHYSICS VARIABLES#
var SPEED = 3000
var MAX_SPEED = 400
var redirect_compensation = 5
var direction_focus = 0.95
###################

var able_to_move = true

func _ready():
	linear_damp = 2.3

func _physics_process(delta):
	
	if(able_to_move):
		if(Input.is_action_pressed("ui_left")):
			
			linear_velocity.x -= SPEED*delta
			
			if(linear_velocity.x > 0):
				linear_velocity.x -= SPEED*delta*redirect_compensation
				
			linear_velocity.y *= direction_focus
			
		if(Input.is_action_pressed("ui_right")):
			
			linear_velocity.x += SPEED*delta
			
			if(linear_velocity.x < 0):
				linear_velocity.x += SPEED*delta*redirect_compensation
				
			linear_velocity.y *= direction_focus
			
		if(Input.is_action_pressed("ui_up")):
			
			linear_velocity.y -= SPEED*delta
			
			if(linear_velocity.y > 0):
				linear_velocity.y -= SPEED*delta*redirect_compensation
				
			linear_velocity.x *= direction_focus
			
		if(Input.is_action_pressed("ui_down")):
			
			linear_velocity.y += SPEED*delta
			
			if(linear_velocity.y < 0):
				linear_velocity.y += SPEED*delta*redirect_compensation
				
			linear_velocity.x *= direction_focus
		
	linear_velocity.x = min(max(linear_velocity.x, -MAX_SPEED), MAX_SPEED)
	linear_velocity.y = min(max(linear_velocity.y, -MAX_SPEED), MAX_SPEED)

func _on_collision_pause_timeout():
	able_to_move = true

func _on_player_body_entered(body):
	able_to_move = false
	get_node("collision_pause").start()
