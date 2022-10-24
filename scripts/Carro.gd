extends Area2D

signal carro_game_over()

var screen_size: Vector2
const CAR_SPEED = 1000
const CAR_ANIM_SIZE = 2

onready var INITIAL_POSITION = position
var shouldMove = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    screen_size = get_viewport_rect().size
    reset()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    if not is_visible_in_tree() or not is_visible():
        return
    if (shouldMove):
        position.x -= CAR_SPEED * delta


func pick_time(frame) -> int:
    return randi() % frame + 1


func reset() -> void:
    position = INITIAL_POSITION
    $MovingTimer.wait_time = pick_time(5)
    $MovingTimer.start()
    pick_carro()


func pick_carro() -> void:
    var selected = randi() % CAR_ANIM_SIZE + 1
    $AnimatedSprite.animation = "carro" + str(selected)

func log_info(timer_name):
    print("[%s] Timeout." % [timer_name])    


func _on_MovingTimer_timeout() -> void:
    log_info($MovingTimer.name)
    $MovingTimer.stop()
    shouldMove = true
    $StopTimer.start()


func _on_StopTimer_timeout() -> void:
    log_info($StopTimer.name)
    $StopTimer.stop()
    reset()


func _on_Carro_body_entered(body: Node) -> void:
    if not is_visible_in_tree() or not is_visible():
        return
    print("[%s] Body %s has entered this body." % [name, body.name])
    emit_signal("carro_game_over")
