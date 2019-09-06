extends KinematicBody2D

var SPEED = 2000
var velocity = Vector2(0, 0)

var ROT_SPEED = 6
var WOBBLE_INTENSITY = 0.8
var angular_momentum = 0

func _ready():
	pass

func _physics_process(delta):
	process_x_movement(delta)
	process_wobble(delta)
	
func process_x_movement(delta):
	if(Input.is_action_pressed("ui_left")):
		velocity.x -= SPEED*delta
		angular_momentum += delta*WOBBLE_INTENSITY
	if(Input.is_action_pressed("ui_right")):
		velocity.x += SPEED*delta
		angular_momentum -= delta*WOBBLE_INTENSITY
	
	velocity *= 0.9
	
	velocity.x = min(max(velocity.x, -20), 20)
	
	move_and_collide(velocity)
	
func process_wobble(delta):
	if(not($Sprite.rotation == 0)):
		angular_momentum += $Sprite.rotation*delta*ROT_SPEED
		
	$Sprite.rotation -= angular_momentum
	
	angular_momentum *= 0.78