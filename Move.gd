extends Node2D
@onready var joystick := $Control/VirtualJoystick  # Adjust the path based on your hierarchy
# Speed of the movement
var speed := 500.0

# Direction of movement
var velocity := Vector2.ZERO

func _process(delta: float) -> void:
	velocity = Vector2.ZERO

	# Input handling
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1

	# Normalize the velocity to prevent faster diagonal movement
	if velocity.length() > 0:
		velocity = velocity.normalized()

	# Move the object
	position += velocity * speed * delta
