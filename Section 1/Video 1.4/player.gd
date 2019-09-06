extends RigidBody2D

var SPEED = 3500
var MAX_SPEED = 700

var redirect_compensation = 5
var direction_focus = 0.95

func _ready():
	linear_damp = 2.3

func _process(delta):
	pass

func _physics_process(delta):
	if(Input.is_action_pressed("ui_left")):
		
		linear_velocity.x -= SPEED*delta
		
		if(linear_velocity.x > 0):
			linear_velocity.x -= SPEED*delta*redirect_compensation
			
		linear_velocity.y *= 0.95
			
	if(Input.is_action_pressed("ui_right")):
		
		linear_velocity.x += SPEED*delta
		
		if(linear_velocity.x < 0):
			linear_velocity.x += SPEED*delta*redirect_compensation
			
		linear_velocity.y *= 0.95
			
	if(Input.is_action_pressed("ui_up")):
		
		linear_velocity.y -= SPEED*delta
		
		if(linear_velocity.y > 0):
			linear_velocity.y -= SPEED*delta*redirect_compensation
			
		linear_velocity.x *= 0.95
			
	if(Input.is_action_pressed("ui_down")):
		
		linear_velocity.y += SPEED*delta
		
		if(linear_velocity.y < 0):
			linear_velocity.y += SPEED*delta*redirect_compensation
		
		linear_velocity.x *= 0.95
		
	linear_velocity.x = min(max(linear_velocity.x, -MAX_SPEED), MAX_SPEED)
	linear_velocity.y = min(max(linear_velocity.y, -MAX_SPEED), MAX_SPEED)