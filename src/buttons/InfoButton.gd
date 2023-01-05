tool
extends Button

export(String) var linked_text: = ""
export(bool) var play_button_linked = false
onready var play_button: = get_node("InfoPlayButton")

func _ready() -> void:
    InfomenuGlobal.connect("infomenu_toggled", self, "disable")
    play_button.visible = InfomenuGlobal.playbutton_dict[linked_text]

func disable(value: bool) -> void:
    self.disabled = value

func _on_button_up() -> void:
    InfomenuGlobal.menu = linked_text
    if play_button_linked == true: 
        play_button.visible = true
        InfomenuGlobal.playbutton_dict[linked_text] = true

func _get_configuration_warning() -> String:
    return "Linked text needs to be set" if linked_text == "" else ""
