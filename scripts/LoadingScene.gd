extends CanvasLayer

signal loading_finished()

var visible_count = 0

func reset() -> void:
    $LoadingTimer.stop()
    visible_count = 0
    hide()

func _process(_value: float) -> void:
    if is_visible() and visible_count == 0:
        $LoadingTimer.start()
        visible_count += 1


func _on_LoadingTimer_timeout() -> void:
    $LoadingTimer.stop()
    emit_signal("loading_finished")
