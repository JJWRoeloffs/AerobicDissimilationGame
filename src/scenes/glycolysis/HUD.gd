extends Control

onready var scene_tree: = get_tree()
onready var text: Label = get_node("Label")

func _ready() -> void:
    GlycolysisGlobal.connect("score_changed", self, "update_interface")
    update_interface()
    
func update_interface() -> void:
    if GlycolysisGlobal.first_part == true:
        text.text = "Collect Two ATP!\nScore: %s" % GlycolysisGlobal.score
    else:
        text.text = "Collect four ADP!\nAvoid the ATP!\nScore: %s" % GlycolysisGlobal.score
