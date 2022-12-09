extends Node

export var next_scene: PackedScene
export var spawned_scene: PackedScene

onready var spawn_path = get_node("GeneratingPath/SpawnLocation")
onready var scene_tree: = get_tree()

func _ready() -> void:
    GlycolysisGlobal.connect("change_scene", self, "go_to_next_scene")
    GlycolysisGlobal.first_part = true
    GlycolysisGlobal.score = 0

func _on_SpawnTimer_timeout() -> void:
    spawn_entity(spawned_scene)

# This function cannot be inherited because it isn't static
func spawn_entity(spawned_scene: PackedScene, to_pick_up: bool = true) -> void:
    spawn_path.unit_offset = randf()

    var entity = spawned_scene.instance()
    add_child(entity)
    
    entity.to_pick_up = to_pick_up
    entity.position = spawn_path.position

    var direction = spawn_path.rotation + PI/2
    direction += rand_range(-PI/4, PI/4)
    entity.rotation = direction

    var velocity = Vector2(rand_range(entity.min_speed, entity.max_speed), 0)
    entity.linear_velocity = velocity.rotated(direction)
    
func go_to_next_scene() -> void:
    scene_tree.change_scene_to(next_scene)
