extends Node

var banco

func _ready() -> void:
	banco = SQLite.new()
	banco.path="user://bdteasks.db"
	banco.open_db()

func verificar_nome():
	var verificação = banco.select_rows("usuario","idUsuario = 1",["*"])
	if verificação:
		var _back: bool = get_tree().change_scene_to_file("res://scenes/escolhajogos.tscn")
	else:
		pass

func salvar_progresso(fase: String, pontosnobanco: String,pontosdefinir: int):
	banco.update_rows("progresso",fase + " = '" + pontosnobanco + "'",{fase:pontosdefinir})

func carregar_progresso(fase: String, pontosnobanco: String):
	# Ao chamar essa função, é necessario definir pontosnobanco = "0"
	var resultado = banco.select_rows("progresso",fase + " = '" + pontosnobanco + "'",[fase])
	# Se a consulta retornar a fase em questão igual a 0 (não terminada), chama função salvar progresso
	if resultado:
		# Salva o progresso definindo igual a 1
		salvar_progresso(fase,"0",1)
		# Volta pra tela de escolha dos jogos
		var _back: bool = get_tree().change_scene_to_file("res://scenes/escolhajogos.tscn")
	# Se o jogo ja estiver salvo, apenas volta pra tela de escolha dos jogos
	else:
		var _back: bool = get_tree().change_scene_to_file("res://scenes/escolhajogos.tscn")
