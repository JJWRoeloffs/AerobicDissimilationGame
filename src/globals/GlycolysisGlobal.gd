extends Node

signal change_scene
signal score_changed

var first_part: = true

var score:= 0 setget set_score

func set_score(value: int) -> void:
    score = value
    emit_signal("score_changed")
    if score > 1 and first_part == true:
        emit_signal("change_scene")
    if score > 3 and first_part == false:
        emit_signal("change_scene")
