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
    var f: = File.new()
    if not f.file_exists(InfomenuGlobal.menu):
        return
    f.open(InfomenuGlobal.menu, File.READ)
    title_node.text = f.get_line()
    while not f.eof_reached():
        body_node.text += (f.get_line() + "\n")
    f.close()
