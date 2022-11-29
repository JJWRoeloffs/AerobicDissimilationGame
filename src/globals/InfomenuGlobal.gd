extends Node

signal infomenu_toggled(value)

onready var scene_tree: = get_tree()

var menu: = "" setget set_infomenu
var infomenu_state: = false setget set_infomenu_state
var pauzed: = false setget set_pauzed

func _ready() -> void:
    reset()

func reset() -> void:
    menu = "res://assets/texts/Test.txt"

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
