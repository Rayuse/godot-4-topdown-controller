extends CharacterBody2D

@export var max_speed := 300
@export_range(0, 10, 0.1) var drag_factor := .1

var desired_velocity := Vector2.ZERO
var steering_velocity := Vector2.ZERO


var rotation_direction := {
	Vector2.UP: -90,
	Vector2.RIGHT: 0,
	Vector2.UP + Vector2.RIGHT : -45,
	Vector2.UP + Vector2.LEFT : -135,
	Vector2.DOWN: 90,
	Vector2.LEFT: 180,
	Vector2.DOWN + Vector2.RIGHT: 45,
	Vector2.DOWN + Vector2.LEFT : 135,
}

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
#	velocity = direction * max_speed

	desired_velocity = direction * max_speed
	steering_velocity = desired_velocity - velocity
	velocity += steering_velocity * drag_factor
	rotation = velocity.angle()
	
#	if direction.round() in rotation_direction:
#		rotation_degrees = rotation_direction[direction.round()]
	move_and_slide()
