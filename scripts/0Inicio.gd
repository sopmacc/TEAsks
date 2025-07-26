extends Control

var nome
var banco

# Função que é executada na abertura da cena atual
func _ready() -> void:
	banco = SQLite.new()
	banco.path="user://bdteasks.db"
	banco.open_db()
	
	
	# Cria o banco e as tabelas
	var usuario = {
		"idUsuario" : {"data_type":"int", "primary_key": true, "not_null": true, "auto_increment": true},
		"nome" : {"data_type":"text"}
	}
	
	var progresso = {
		"fase1Completa" : {"data_type":"int"},
		"fase2Completa" : {"data_type":"int"},
		"fase3Completa" : {"data_type":"int"},
		"fase4Completa" : {"data_type":"int"}
	}
	
	banco.create_table("usuario", usuario)
	banco.create_table("progresso", progresso)
	
	SqlController.verificar_nome()
	#get_viewport().size = DisplayServer.screen_get_size()

# Função do botão Enviar
func btnEntrar() -> void:
	# Recebe o nome digitado na variável nome
	nome = $Container/edtNome.text
	
	
	# Se o usuário não tiver inserido o nome nada acontece
	if (nome == ""):
		pass
	# Abre a cena de escolha de jogos e salva no banco
	else:
		var dadosUsuario = {
			"nome" : $Container/edtNome.text
		}
		var dadosProgresso = {
			"fase1Completa" : 0,
			"fase2Completa" : 0,
			"fase3Completa" : 0,
			"fase4Completa" : 0
		}
		banco.insert_row("usuario", dadosUsuario)
		banco.insert_row("progresso", dadosProgresso)
		var _game: bool = get_tree().change_scene_to_file("res://scenes/escolhajogos.tscn")

# Função para sair do aplicativo
func btnSair() -> void:
	get_tree().quit()

# Função do botão de som
func btnSom() -> void:
	if GlobalName.som == true:
		GlobalName.som = false
		$trSom.texture = load("res://assets/escolha de atividade/Sem Som Icone.png")
	else:
		GlobalName.som = true
		$trSom.texture = load("res://assets/escolha de atividade/Som Icone.png")

# Função do botão de Música
func btnMusica() -> void:
	if GlobalName.musica == true:
		GlobalName.musica = false
		$trMusic.texture = load("res://assets/escolha de atividade/Sem Musica Icone.png")
		MusicController.pararmusica()
	else:
		GlobalName.musica = true
		$trMusic.texture = load("res://assets/escolha de atividade/Musica Icone.png")
		MusicController.tocarmusica()

func _on_button_pressed() -> void:
	SqlController.select_nome()
