extends Control

# Textos exibidos
var txtDica:String = "Você deve apertar no quadrado que completa a palavra exibida na TV!"
var txtFim:String = "Parabéns! Você completou a sala! Que tal voltar e escolher outro cômodo?"

# Resposta da pergunta
@onready var txtRes: String = "DO"
# Seleção atual
@onready var txtSelecionado: String
# Acertou ou não
var resultado: bool = 0

var seErrado = preload("res://assets/sons/erro sound effect.wav")
var seCerto = preload("res://assets/sons/som de certo.mp3")

# Função executada ao iniciar a cena
func _ready() -> void:
	# Tornar visível o container de explicação
	$containerAtividade.visible = true
	$containerAtividade/containerTexto/lblTexto.text = "Que tal assistir um pouco de TV " + GlobalName.nomeBanco + "? Vamos completar a palavra que está escrita nela!"
	$containerAtividade/trComecar.visible = true
	$containerAtividade/trVoltar.visible = true
	
	# Ocultar botoes do final
	$containerAtividade/trDenovo.visible = false
	$containerAtividade/trContinuar.visible = false
	
	# Interface
	$trDica.visible = false
	$trTextoDica.visible = false
	
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

# Verificação se a resposta está certa
func verificacao() -> void:
	if txtRes == txtSelecionado:
		print("Completo")
		resultado = true
		$trOpcao1/btnOpc1.disabled = true
		$trOpcao2/btnOpc2.disabled = true
		$trOpcao3/btnOpc3.disabled = true
		$trOpcao4/btnOpc4.disabled = true
		$Timer.start()
		# Verificar se o som está ativado
		if GlobalName.som == true:
			# Acessar o nó AudioStreamPlayer e configurar o stream
			$audio.stream = seCerto
			# Tocar o áudio
			$audio.play()
	else:
		print("erado")
		resultado = false
		# Verificar se o som está ativado
		if GlobalName.som == true:
			# Acessar o nó AudioStreamPlayer e configurar o stream
			$audio.stream = seErrado
			# Tocar o áudio
			$audio.play()

# Função de tirar todos os selecionados
func selecao() -> void:
	$trOpcao1.modulate = Color.WHITE
	$trOpcao2.modulate = Color.WHITE
	$trOpcao3.modulate = Color.WHITE
	$trOpcao4.modulate = Color.WHITE

# Escolha certa
func btnOpc1() -> void:
	selecao()
	$trOpcao1.modulate = Color.LIGHT_GREEN
	
	txtSelecionado = $trOpcao1/lblOpc1.text
	$trTv/trResposta/lblRes.text = txtSelecionado
	verificacao()

# Escolha errado
func btnOpc2() -> void:
	selecao()
	$trOpcao2.modulate = Color.INDIAN_RED
	
	txtSelecionado = $trOpcao2/lblOpc2.text
	$trTv/trResposta/lblRes.text = txtSelecionado
	verificacao()

# Escolha errado
func btnOpc3() -> void:
	selecao()
	$trOpcao3.modulate = Color.INDIAN_RED
	
	txtSelecionado = $trOpcao3/lblOpc3.text
	$trTv/trResposta/lblRes.text = txtSelecionado
	verificacao()

# Escolha errado
func btnOpc4() -> void:
	selecao()
	$trOpcao4.modulate = Color.INDIAN_RED
	
	txtSelecionado = $trOpcao4/lblOpc4.text
	$trTv/trResposta/lblRes.text = txtSelecionado
	verificacao()

# Função do botão voltar
func btnVoltar() -> void:
	# Volta para a seleção de jogo
	var _back: bool = get_tree().change_scene_to_file("res://scenes/escolhajogos.tscn")

# Função para sair da atividade
func btnSair() -> void:
	# Volta para a seleção de jogo
	var _back: bool = get_tree().change_scene_to_file("res://scenes/escolhajogos.tscn")

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

# Botão de dica
func btnDica() -> void:
	# Exibe a dica de como prosseguir a atividade
	$containerAtividade.visible = true
	$containerAtividade/containerTexto/lblTexto.text = txtDica
	$trDica.visible = false
	$trTextoDica.visible = false

# Botão de Reiniciar
func btnDenovo():
	var _restart: bool = get_tree().change_scene_to_file("res://scenes/salaTV.tscn")

# Botão Continuar
func btnContinuar():
	SqlController.carregar_progresso("fase1Completa","0")

# Botão de começar
func btnComecar() -> void:
	$containerAtividade.visible = false
	$trDica.visible = true
	$trTextoDica.visible = true

# Quando o timer acabar
func _on_timer_timeout() -> void:
	# Mostrar a tela de conclusão
	$containerAtividade.visible = true
	$containerAtividade/containerTexto/lblTexto.text = "Parabéns " + GlobalName.nomeBanco + "! Você completou a sala! Que tal voltar e escolher outro cômodo?"
	$containerAtividade/trDenovo.visible = true
	$containerAtividade/trContinuar.visible = true
	
	# Ocultar botoes do inicio
	$containerAtividade/trComecar.visible = false
	$containerAtividade/trVoltar.visible = false
	$trDica.visible = false
	$trTextoDica.visible = false
