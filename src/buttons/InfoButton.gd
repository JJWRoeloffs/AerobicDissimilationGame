tool
extends Button

#export(String, FILE) var next_scene_path: = ""

onready var scene_tree: = get_tree()
onready var info_overlay: ColorRect = get_node("InfoRect")

var paused: = false setget set_paused

func _unhandled_input(event: InputEvent) -> void:
    if signal._on_InfoButton_up():
        paused = not paused
        #get_tree().change_scene(next_scene_path)
        info_overlay.visible = true

func set_paused(value: bool=true) -> void:
    paused = value
    scene_tree.paused = value
    info_overlay.visible = value
    
#func _get_configuration_warning() -> String:
#    if next_scene_path == "":
#        return "next_scene_path has to be set for button to work" 
#    else: 
#        return ""
