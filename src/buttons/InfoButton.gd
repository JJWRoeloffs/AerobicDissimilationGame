tool
extends Button

export(String, FILE) var linked_text: = ""


func _ready() -> void:
    InfomenuGlobal.connect("infomenu_toggled", self, "disable")

func disable(value: bool) -> void:
    self.disabled = value

func _on_button_up() -> void:
    InfomenuGlobal.menu = linked_text

func _get_configuration_warning() -> String:
    return "Linked text needs to be set" if linked_text == "" else ""
