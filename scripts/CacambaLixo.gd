extends Area2D

signal hit_trash(cacamba_nome, lixo_nome)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#    pass
    

func body_entered_cacamba(body: KinematicBody2D) -> void:
    var current_anim: AnimatedSprite = body.get_child(0)
    print("[", name, "]", " The body with name ", current_anim.animation, " is inside this body.")
    emit_signal("hit_trash", name, current_anim.animation)
