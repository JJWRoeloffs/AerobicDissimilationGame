extends Node

export var next_scene: PackedScene
export var avoid_scene: PackedScene
export var pickup_scene: PackedScene
export var pickup_ratio: int

onready var spawn_path: = get_node("GeneratingPath/SpawnLocation")
onready var spawn_timer: = get_node("SpawnTimer")
onready var player: = get_node("Player")
onready var scene_tree: = get_tree()

func _ready() -> void:
    GlycolysisGlobal.connect("change_scene", self, "go_to_next_scene")
    GlycolysisGlobal.first_part = false
    GlycolysisGlobal.score = 0

    player.connect("spawn_entity", self, "add_child")

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

func _on_SpawnTimer_timeout() -> void:
    if spawn_timer.wait_time > 0.5:
        spawn_timer.wait_time *= 0.75
    if randi() % pickup_ratio == 0:
        spawn_entity(pickup_scene, true)
    else:
        spawn_entity(avoid_scene, false)

func go_to_next_scene() -> void:
    scene_tree.change_scene_to(next_scene)
