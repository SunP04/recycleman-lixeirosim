extends KinematicBody2D

const POSSIBLE_TRASH = ["metal", "papel", "plastico", "pilha"]
var screen_size: Vector2

onready var DEFAULT_POS = position

var speed = 500
var target = Vector2()
var velocity = Vector2()
var timesClicked = 0
var shouldMove = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    screen_size = get_viewport_rect().size


func _physics_process(_d):
    if not is_visible():
        return
    if Input.is_mouse_button_pressed(BUTTON_LEFT) && timesClicked < 1:
        shouldMove = true
        target = get_global_mouse_position()
        timesClicked += 1
        $MovingTimer.start()
    if (target - position) == Vector2.ZERO:
        shouldMove = false
    if shouldMove:
        velocity = (target - position).normalized() * speed
        if (target - position).length() > 5:
            velocity = move_and_slide(velocity)


func new_trash() -> void:
    var pos = randi() % POSSIBLE_TRASH.size()
    $AnimatedSprite.animation = POSSIBLE_TRASH[pos]


func reset() -> void:
    new_trash()
    position = DEFAULT_POS
    shouldMove = false
    timesClicked = 0


func _on_MovingTimer_timeout() -> void:
    $MovingTimer.stop()
    reset()
