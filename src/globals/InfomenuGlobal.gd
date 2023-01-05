extends Node

signal infomenu_toggled(value)

onready var scene_tree: = get_tree()

var menu: = "" setget set_infomenu
var infomenu_state: = false setget set_infomenu_state
var pauzed: = false setget set_pauzed
var playbutton_dict: = {}

func _ready() -> void:
    reset()

func reset() -> void:
    menu = "res://assets/texts/Test.txt"
    playbutton_dict = create_playbutton_dict("res://assets/texts/")


func set_infomenu(value: String) -> void:
    menu = value
    set_infomenu_state(true)

func set_infomenu_state(value: bool) -> void:
    infomenu_state = value
    set_pauzed(value)
    emit_signal("infomenu_toggled", value)

func set_pauzed(value: bool) -> void:
    pauzed = value
    scene_tree.paused = pauzed

func create_playbutton_dict(dir: String):
    var files = list_files_in_directory(dir)
    var dict: = {}
    for file in files:
        var file_name = dir + file
        dict[file_name] = false
    return dict

func list_files_in_directory(path):
    var files = []
    var dir = Directory.new()
    dir.open(path)
    dir.list_dir_begin()

    while true:
        var file = dir.get_next()
        if file == "":
            break
        elif not file.begins_with("."):
            files.append(file)

    dir.list_dir_end()

    return files
