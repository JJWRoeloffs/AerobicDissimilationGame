tool
extends Button

export(String, FILE) var next_scene_path: = ""

onready var scene_tree: = get_tree()

func _ready() -> void:
    InfomenuGlobal.connect("infomenu_toggled", self, "disable")

func disable(value: bool) -> void:
    self.disabled = value

func _on_button_up() -> void:
    scene_tree.change_scene(next_scene_path)

func _get_configuration_warning() -> String:
    return "next_scene_path has to be set" if next_scene_path == "" else ""
