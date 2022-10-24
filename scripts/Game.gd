extends Control

signal game_over(reason)

func reset() -> void:
    $Carro.reset()
    $Lixos.reset()

func play_music():
    $BgSound.play()
    
func stop_music():
    $BgSound.stop()


func set_image(img) -> void:
    $Cenario.texture = img


func set_score(score: int) -> void:
    $ScoreLabel/ScoreValue.text = str(score)


func _on_Carro_carro_game_over() -> void:
    if not is_visible_in_tree() or not is_visible():
        return
    print("[%s] Carro game over event triggered." % [name ])
    emit_signal("game_over", "hit carro")
