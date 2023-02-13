extends KinematicBody2D

var motion = Vector2(0,0)
var speed = 160
var gravty = 10
var jamp = -270
var double_jamp = true



func _physics_process(delta):
	Move()
	Gravty()
	move_and_slide(motion,Vector2.UP)
	pass
	
func Move():
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
	
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
	else:
		motion.x = 0
	
	pass
	
func Gravty():
	if !is_on_floor():
		motion.y += gravty
	else:
		double_jamp = true
		motion.y = gravty
		if Input.is_action_just_pressed("jamp"):
			motion.y = jamp
			
	if !is_on_floor() && double_jamp == true && Input.is_action_just_pressed("jamp"):
		motion.y = jamp 
		double_jamp = false
		

	
		
		
		
