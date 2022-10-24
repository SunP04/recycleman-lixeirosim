extends CanvasLayer

signal restart_game()

func play_sound() -> void:
    $GameOverSound.play()

func final_score(score: int) -> void:
    print("Final score: %d" % [score])
    $FinalScore/FinalScoreValue.text = str(score)


func _on_RestartButton_pressed() -> void:
    print("[%s] Button pressed." % [$RestartButton.name])
    $GameOverSound.stop()
    emit_signal("restart_game")
