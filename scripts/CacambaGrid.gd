extends HBoxContainer

signal cacamba_hit(nome_cacamba, nome_lixo)


func on_hit(cacamba_nome, lixo_nome) -> void:
    if not is_visible_in_tree() or not is_visible():
        return
    emit_signal("cacamba_hit", cacamba_nome, lixo_nome)
