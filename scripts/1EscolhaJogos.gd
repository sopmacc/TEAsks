extends Control

var banco

# Função que é executada na abertura da cena atual
func _ready() -> void:
	banco = SQLite.new()
	banco.path="user://bdteasks.db"
	banco.open_db()
	
	verificar_progresso()
	
	# Pega o nome no banco e põe em uma variavel global para ser usada posteriormente
	var nome = banco.select_rows("usuario", "idUsuario = 1", ["nome"])
	if nome.size() > 0:
		# Acessa o primeiro item da lista e o campo "nome"
		GlobalName.nomeBanco = nome[0]["nome"]
	
	# Fecha o menu fechado na abertura da cenas
	
	# Verificar se o som está ativado
	if GlobalName.som == true:
		$trSom.texture = load("res://assets/escolha de atividade/Som Icone.png")
	else:
		$trSom.texture = load("res://assets/escolha de atividade/Sem Som Icone.png")
	
	# Verificar se a música está ativada
	if GlobalName.musica == true:
		$trMusic.texture = load("res://assets/escolha de atividade/Musica Icone.png")
	else:
		$trMusic.texture = load("res://assets/escolha de atividade/Sem Musica Icone.png")

func verificar_progresso():
	var fase1 = banco.select_rows("progresso","fase1Completa = 1",["*"])
	var fase2 = banco.select_rows("progresso","fase2Completa = 1",["*"])
	var fase3 = banco.select_rows("progresso","fase3Completa = 1",["*"])
	var fase4 = banco.select_rows("progresso","fase4Completa = 1",["*"])
	
	if fase1:
		$trSala.texture = load("res://assets/escolha de atividade/Sala Concluida.png")
	
	if fase2:
		$trCozinha.texture = load("res://assets/escolha de atividade/Cozinha Concluida.png")
	
	if fase3:
		$trBanheiro.texture = load("res://assets/escolha de atividade/Banheiro Concluido.png")
	
	if fase4:
		$trQuarto.texture = load("res://assets/escolha de atividade/Quarto Concluido.png")

# Função do botão da sala
func btnSala() -> void:
	# Inicia a cena Sala
	var _game: bool = get_tree().change_scene_to_file("res://scenes/salaMesa.tscn")

# Função do botão da cozinha
func btnCozinha() -> void:
	# Inicia a cena Cozinha
	var _game: bool = get_tree().change_scene_to_file("res://scenes/cozinhaFogao.tscn")

# Função do botão banheiro
func btnBanheiro() -> void:
	# Inicia a cena Banheiro
	var _game: bool = get_tree().change_scene_to_file("res://scenes/banheiroPia.tscn")

# Função do quarto
func btnQuarto() -> void:
	# Inicia a cena Quarto
	var _game: bool = get_tree().change_scene_to_file("res://scenes/quartoRoupa.tscn")

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
