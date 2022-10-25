extends Node


const LIXOS_SCORING = {
    "metal": "LixoAmarelo",
    "papel": "LixoAzul",
    "plastico": "LixoVermelho",
    'pilha': "LixoLaranja",
    'vidro': "LixoVerde"
}

export (int) var score

func _ready() -> void:
    score = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
    if Input.is_action_pressed("quit"):
        get_tree().quit(0)
    if not $Game.visible:
        return
    var lixo_pos = $Game/Lixos.position
    if lixo_pos.y < 442:
        print("Resetting trash to original position.")
        $Game/Lixos.reset()
    if lixo_pos.y > 876 and lixo_pos == Vector2.ZERO:
        $Game/Lixos.reset()


func screen_reset():
    $Game.reset()


func full_reset():
    score = 0
    screen_reset()
    $Game.hide()
    $GameOver.hide()
    $HUD.reset()
    $HUD.show()


func start_game(img) -> void:
    $HUD.hide()
    $GameOver.hide()
    
    $Game.play_music()
    $Game.set_image(img)
    $Game.show()
    screen_reset()


func transform_name(lixo_name: String) -> String:
    return "Lixo" + lixo_name.capitalize()

func _on_cacamba_hit(nome_cacamba: String, nome_lixo: String) -> void:
    if LIXOS_SCORING[nome_lixo] == nome_cacamba:
        score += 1
        $Game.set_score(score)
    print("Score: ", score)
    screen_reset()


func _on_Game_game_over(reason) -> void:
    print("[%s] Game over event triggered(%s)." % [name, reason])
    $Game.hide()
    $Game.stop_music()
    $GameOver.show()
    $GameOver.play_sound()
    $GameOver.final_score(score)


func _on_GameOver_restart_game() -> void:
    print("[%s] Restart game event triggered." % [$GameOver.name])
    full_reset()



func _on_Quit_quit_game() -> void:
    get_tree().quit(0)
