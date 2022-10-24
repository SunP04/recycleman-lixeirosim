extends CanvasLayer

signal start_game(bg_img)

var scene_img

func _ready():
    $MainMenuSound.play()


func reset() -> void:
    $MainMenuSound.play()
    $PlayHUD.hide()
    $PickScene.hide()
    $LoadingScene.reset()
    $PlayHUD.show()

func _on_PlayHUD_change_hud_scene() -> void:
    print("[%s] Button has been pressed." % [$PlayHUD.name])
    $PlayHUD.hide()
    $PickScene.show()


func _on_PickScene_scene_chosen(img) -> void:
    print("[%s] Has been pressed, with image: %s" % [$PickScene.name, img])
    $PickScene.hide()
    $LoadingScene.show()
    scene_img = img


func _on_LoadingScene_loading_finished() -> void:
    print("[%s] Loading has ended." % [$LoadingScene.name])
    $LoadingScene.hide()
    $MainMenuSound.stop()
    emit_signal("start_game", scene_img)
