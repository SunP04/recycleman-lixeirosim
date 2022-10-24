extends CanvasLayer

signal change_hud_scene()


func _on_Button_pressed() -> void:
    emit_signal("change_hud_scene")
