extends Label

signal quit_game()

var canQuit = false

func _process(delta: float) -> void:
    if Input.is_mouse_button_pressed(BUTTON_LEFT) and canQuit:
        emit_signal("quit_game")


func _on_Quit_mouse_exited() -> void:
    canQuit = false


func _on_Quit_mouse_entered() -> void:
    canQuit = true
