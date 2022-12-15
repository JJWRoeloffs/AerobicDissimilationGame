extends Area2D

signal spawn_entity(entity)

export var speed: = 400.0
export var size: = Vector2(75, 75)
export var death_scene: PackedScene

export var spawn_collected: PackedScene

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
    if body.to_pick_up:
        GlycolysisGlobal.score += 1
        spawn_entity(spawn_collected)
    else:
        scene_tree.change_scene_to(death_scene)

func spawn_entity(spawned_scene: PackedScene) -> void:
    var entity = spawned_scene.instance()
    
    entity.to_pick_up = false
    entity.position = self.position

    var direction = randf()

    entity.rotation = direction
    var new_location = size.rotated(direction)
    entity.position.x += new_location.x
    entity.position.y += new_location.y
    
    var velocity = Vector2(rand_range(entity.min_speed, entity.max_speed), 0)
    entity.linear_velocity = velocity.rotated(direction)
    
    emit_signal("spawn_entity", entity)
