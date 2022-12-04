extends RigidBody2D

export var min_speed: = 150
export var max_speed: = 250

func _ready() -> void:
    scale = Vector2(0.25, 0.25)

func _on_screen_exited() -> void:
    queue_free()
