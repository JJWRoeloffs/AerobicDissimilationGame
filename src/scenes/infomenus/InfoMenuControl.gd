tool
extends Control

onready var title_node: = get_node("InfoRect/VBoxContainer/InfoTitle")
onready var body_node: = get_node("InfoRect/VBoxContainer/InfoText")

func _ready() -> void:
    InfomenuGlobal.connect("infomenu_toggled", self, "toggle_menu")

func toggle_menu(value: bool) -> void:
    if value == false:
        reset_text()
    else:
        update_text()

func reset_text() -> void:
    title_node.text = ""
    body_node.text = ""

func update_text() -> void:
    var text = InfomenuGlobal.hackfix_dict[InfomenuGlobal.menu]
    var text_array = text.split("\n", false, 1)
    title_node.text = text_array[0]
    body_node.text = text_array[1]
