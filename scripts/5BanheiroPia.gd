extends Control

# Textos exibidos
var txtDica:String = "Aperte nos objetos e depois aperte na sombra correspondente!"

var obj1:bool = false
var obj2:bool = false
var obj3:bool = false

var qntAcertos:int = 0
var qntAlvo:int = 3

var seErrado = preload("res://assets/sons/erro sound effect.wav")
var acerto = preload("res://assets/sons/som de certo.mp3")

# Função executada ao iniciar a cena
func _ready() -> void:
	# Tornar visível o container de explicação
	$containerAtividade.visible = true
	$containerAtividade/containerTexto/lblTexto.text = "Bem vindo ao banheiro " + GlobalName.nomeBanco + "!\nOs itens estão fora do lugar! Coloque eles de volta no armário em seus devidos lugares."
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

# Função para tocar o som de acerto
func somAcerto():
	# Verificar se o som está ativado
		if GlobalName.som == true:
			# Acessar o nó AudioStreamPlayer e configurar o stream
			$audio.stream = acerto
			# Tocar o áudio
			$audio.play()

# Função para tocar o som de erro
func somErro():
	if GlobalName.som == true:
			# Acessar o nó AudioStreamPlayer e configurar o stream
			$audio.stream = seErrado
			# Tocar o áudio
			$audio.play()

# Verificar a Seleção
func verificarSelecao():
	if obj1 == true:
		$trPia/trObj1.texture = load("res://assets/banheiro/Creme Pia Banheiro Selecionado.png")
		
		$trPia/trObj2.texture = load("res://assets/banheiro/Sabao Pia Banheiro.png")
		$trPia/trObj3.texture = load("res://assets/banheiro/Sabonete Pia Banheiro.png")
	
	elif obj2 == true:
		$trPia/trObj2.texture = load("res://assets/banheiro/Sabao Pia Banheiro Selecionado.png")
		
		$trPia/trObj1.texture = load("res://assets/banheiro/Creme Pia Banheiro.png")
		$trPia/trObj3.texture = load("res://assets/banheiro/Sabonete Pia Banheiro.png")
	
	else:
		$trPia/trObj3.texture = load("res://assets/banheiro/Sabonete Pia Banheiro Selecionado.png")
		
		$trPia/trObj1.texture = load("res://assets/banheiro/Creme Pia Banheiro.png")
		$trPia/trObj2.texture = load("res://assets/banheiro/Sabao Pia Banheiro.png")

# Função do Objeto 1
func btnObj1() -> void:
	# Ativar objeto atual
	obj1 = true
	
	# Desativar demais objetos
	obj2 = false
	obj3 = false
	
	verificarSelecao()

# Função do Objeto 2
func btnObj2() -> void:
	# Ativar objeto atual
	obj2 = true
	
	# Desativar demais objetos
	obj1 = false
	obj3 = false
	
	verificarSelecao()

# Função do Objeto 3
func btnObj3() -> void:
	# Ativar objeto atual
	obj3 = true
	
	# Desativar demais objetos
	obj1 = false
	obj2 = false
	
	verificarSelecao()

# Verificar Acertos
func verificarAcertos():
	if qntAcertos == qntAlvo:
		$Timer.start()

# Função da Sombra 1
func btnSombra1():
	# Verifica se o objeto correspondente está selecionado
	if obj1 == true:
		# Aumenta a quantidade de acertos
		qntAcertos += 1
		
		# Verifica se o minigame foi concluido
		verificarAcertos()
		
		# Oculta o objeto correto
		$trPia/trObj1.visible = false
		
		# Muda a sombra
		$trArmario/trSombra1.texture = load("res://assets/banheiro/Creme Pia Banheiro.png")
		$trArmario/trSombra1/btnSombra1.disabled = true
		
		somAcerto()
	
	# Se tiver selecionado errado
	if obj2 == true or obj3 == true:
		somErro()

# Função da Sombra 2
func btnSombra2():
	# Verifica se o objeto correspondente está selecionado
	if obj2 == true:
		# Aumenta a quantidade de acertos
		qntAcertos += 1
		
		# Verifica se o minigame foi concluido
		verificarAcertos()
		
		# Oculta o objeto correto
		$trPia/trObj2.visible = false
		
		# Muda a sombra
		$trArmario/trSombra2.texture = load("res://assets/banheiro/Sabao Pia Banheiro.png")
		$trArmario/trSombra2/btnSombra2.disabled = true
		
		somAcerto()
	
	# Se tiver selecionado errado
	if obj1 == true or obj3 == true:
		somErro()

# Função da Sombra 3
func btnSombra3():
	# Verifica se o objeto correspondente está selecionado
	if obj3 == true:
		# Aumenta a quantidade de acertos
		qntAcertos += 1
		
		# Verifica se o minigame foi concluido
		verificarAcertos()
		
		# Oculta o objeto correto
		$trPia/trObj3.visible = false
		
		# Muda a sombra
		$trArmario/trSombra3.texture = load("res://assets/banheiro/Sabonete Pia Banheiro.png")
		$trArmario/trSombra3/btnSombra3.disabled = true
		
		somAcerto()
	
	# Se tiver selecionado errado
	if obj1 == true or obj2 == true:
		somErro()

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
	var _restart: bool = get_tree().change_scene_to_file("res://scenes/banheiroPia.tscn")

# Botão Continuar
func btnContinuar():
	SqlController.carregar_progresso("fase3Completa","0")

# Botão de começar
func btnComecar() -> void:
	$containerAtividade.visible = false
	$trDica.visible = true
	$trTextoDica.visible = true

# Quando o timer acabar
func _on_timer_timeout() -> void:
	# Mostrar a tela de conclusão
	$containerAtividade.visible = true
	$containerAtividade/containerTexto/lblTexto.text = "Parabéns " + GlobalName.nomeBanco + "! Você completou o banheiro! Que tal voltar e escolher outro cômodo?"
	$containerAtividade/trDenovo.visible = true
	$containerAtividade/trContinuar.visible = true
	
	# Ocultar botoes do inicio
	$containerAtividade/trComecar.visible = false
	$containerAtividade/trVoltar.visible = false
	$trDica.visible = false
	$trTextoDica.visible = false
