extends Area2D

export var speed: = 400.0
export var death_scene: PackedScene

onready var screen_size = get_viewport_rect().size
onready var scene_tree: = get_tree()

func get_input_direction() -> Vector2:
    return Vector2(
        Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
        Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
    ).normalized()

func _process(delta: float) -> void:
    var direction = get_input_direction()
    
    position += direction * speed * delta
    
    position.x = clamp(position.x, 0, screen_size.x)
    position.y = clamp(position.y, 0, screen_size.y)


func _on_body_entered(body: Node) -> void:
    body.queue_free()
    if GlycolysisGlobal.first_part == true:
        GlycolysisGlobal.score += 1
    else:
        if body.to_pick_up:
            GlycolysisGlobal.score += 1
        else:
            scene_tree.change_scene_to(death_scene)
