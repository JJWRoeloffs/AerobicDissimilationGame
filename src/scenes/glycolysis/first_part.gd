extends Node

export (PackedScene) var spawned_scene


func _on_SpawnTimer_timeout() -> void:
    spawn_entity()
    
func spawn_entity() -> void:
    var spawn_location: = $GeneratingPath/SpawnLocation
    spawn_location.unit_offset = randf()
    
    var entity = spawned_scene.instance()
    add_child(entity)
    
    entity.position = spawn_location.position
    
    var direction = spawn_location.rotation + PI/2
    direction += rand_range(-PI/4, PI/4)
    entity.rotation = direction
    
    var velocity = Vector2(rand_range(entity.min_speed, entity.max_speed), 0)
    entity.linear_velocity = velocity.rotated(direction)
