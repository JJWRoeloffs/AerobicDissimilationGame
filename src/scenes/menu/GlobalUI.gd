extends Control

onready var scene_tree: = get_tree()
onready var info_menu_overlay: ColorRect = get_node("InfoMenuOverlay")

func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("open_info"):
        InfomenuGlobal.infomenu_state = not InfomenuGlobal.infomenu_state
        scene_tree.set_input_as_handled()
    if event.is_action_pressed("escape"):
        if InfomenuGlobal.infomenu_state == true:
            InfomenuGlobal.infomenu_state = false
            scene_tree.set_input_as_handled()

func _ready() -> void:
    InfomenuGlobal.connect("infomenu_toggled", self, "set_infomenu_visibility")

func set_infomenu_visibility(value: bool) -> void:
    info_menu_overlay.visible = value
