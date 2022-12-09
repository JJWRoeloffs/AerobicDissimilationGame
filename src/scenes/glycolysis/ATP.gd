extends RigidBody2D

export var min_speed: = 250
export var max_speed: = 350

var to_pick_up: = true

func _on_screen_exited() -> void:
    queue_free()
