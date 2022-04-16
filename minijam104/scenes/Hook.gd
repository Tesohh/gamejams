extends Area2D

#var velocity = Vector2.ZERO
func _physics_process(delta):
	if get_parent().visible:
		position.x += Input.get_action_raw_strength("ui_right") - Input.get_action_raw_strength("ui_left")
		position.y += Input.get_action_raw_strength("ui_down") - Input.get_action_raw_strength("ui_up")
#	var input_vector = Vector2.ZERO	
#	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
#	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
#
#	var moving = input_vector != Vector2.ZERO
#	if moving:
#		facing = vec2facing(input_vector)
##		$ToolSprite.rotation_degrees = facing2deg(facing)
#		velocity = velocity.move_toward(input_vector * speed, acceleration)
#	else:
#		velocity = velocity.move_toward(Vector2.ZERO, 150)
#
#	velocity = move_and_slide(velocity)
