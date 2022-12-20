extends KinematicBody2D

const POSSIBLE_TRASH = ["metal", "papel", "plastico", "pilha", "vidro"]
var screen_size: Vector2

onready var DEFAULT_POS = position

var speed = 570
var rotationSpeed = .75
var target = Vector2()
var velocity = Vector2()
var timesClicked = 0
var shouldMove = false
var rotationDir = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    screen_size = get_viewport_rect().size


func _physics_process(delta: float):
    if not is_visible():
        return
    if Input.is_mouse_button_pressed(BUTTON_LEFT) && timesClicked < 1:
        shouldMove = true
        target = get_global_mouse_position()
        timesClicked += 1
        $MovingTimer.start()
    if (target - position) == Vector2.ZERO:
        shouldMove = false
        rotation = 0
    if shouldMove:
        rotationDir -= 1
        rotation += rotationDir * rotationSpeed
        velocity = (target - position).normalized() * speed
        if (target - position).length() > 5:
            velocity = move_and_slide(velocity) * delta


func new_trash() -> void:
    var pos = randi() % POSSIBLE_TRASH.size()
    $AnimatedSprite.animation = POSSIBLE_TRASH[pos]
    


func reset() -> void:
    hide()
    new_trash()
    position = DEFAULT_POS
    shouldMove = false
    timesClicked = 0
    rotationDir = 0 
    show()

func _on_MovingTimer_timeout() -> void:
    $MovingTimer.stop()
    reset()
