extends CharacterBody2D

@export var max_speed := 300
@export_range(0,10, 0.1) var drag_factor := 0.1

var desired_velocity := Vector2.ZERO
var steering_velocity := Vector2.ZERO

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector('move_left', "move_right","move_up","move_down")
	desired_velocity = direction * max_speed
	steering_velocity = desired_velocity - velocity
	velocity += steering_velocity * drag_factor
	rotation = velocity.angle()
	move_and_slide()


