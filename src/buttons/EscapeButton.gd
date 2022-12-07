extends Button

onready var scene_tree: = get_tree()

#TODO make it close more than just the infomenu
func _on_button_up() -> void:
    if InfomenuGlobal.infomenu_state == true:
        InfomenuGlobal.infomenu_state = false
        scene_tree.set_input_as_handled()
