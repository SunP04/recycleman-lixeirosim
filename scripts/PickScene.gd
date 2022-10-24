extends CanvasLayer

signal scene_chosen(img)

var LIGHT_IMG = load("res://art/cenario/light.jpeg")
var MID_IMG = load("res://art/cenario/mid.jpeg")
var DARK_IMG = load("res://art/cenario/dark.jpeg")

func _on_Light_pressed() -> void:
    emit_signal("scene_chosen", LIGHT_IMG)


func _on_Mid_pressed() -> void:
    emit_signal("scene_chosen", MID_IMG)
    

func _on_Dark_pressed() -> void:
    emit_signal("scene_chosen", DARK_IMG)
