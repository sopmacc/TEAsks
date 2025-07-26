extends Control

# Textos exibidos
var txtDica:String = "Você deve apertar em cima de cada objeto até que restem apenas os objetos da sala em cima da mesa!"

var obj1:int = 0
var obj2:int = 0
var obj3:int = 0

var seErrado = preload("res://assets/sons/erro sound effect.wav")
var acerto = preload("res://assets/sons/som de certo.mp3")

# Função executada ao iniciar a cena
func _ready() -> void:
	# Tornar visível o container de explicação
	$containerAtividade.visible = true
	$containerAtividade/containerTexto/lblTexto.text = "Bem vindo à sala " + GlobalName.nomeBanco + "!\nAqui você deve organizar a mesa. Aperte nos objetos até que sobrem apenas os objetos da sala.\nVamos lá?"
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

# Função que altera o objeto ao clicar
func mudar():
	if obj1 == 0:
		$trMesa/trObj1.texture = load("res://assets/sala/Tesoura Sala.png")
	elif obj1 == 1:
		$trMesa/trObj1.texture = load("res://assets/sala/Garfo Sala.png")
	elif obj1 == 2:
		#certo
		$trMesa/trObj1.texture = load("res://assets/sala/Controle Remoto Sala.png")
	
	if obj2 == 0:
		$trMesa/trObj2.texture = load("res://assets/sala/Sapatos Sala.png")
	elif obj2 == 1:
		#certo
		$trMesa/trObj2.texture = load("res://assets/sala/Livros Sala.png")
	elif obj2 == 2:
		$trMesa/trObj2.texture = load("res://assets/sala/Martelo Sala.png")
	
	if obj3 == 0:
		$trMesa/trObj3.texture = load("res://assets/sala/Banana Sala.png")
	elif obj3 == 1:
		#certo
		$trMesa/trObj3.texture = load("res://assets/sala/Luminária Sala.png")
	elif obj3 == 2:
		$trMesa/trObj3.texture = load("res://assets/sala/Sapatos Sala.png")

# Função de verificação dos objetos em cima da mesa
func verificar():
	if obj1 != 2 or obj2 != 1 or obj3 != 1:
		pass
		# Verificar se o som está ativado
		#if GlobalName.som == true:
			# Acessar o nó AudioStreamPlayer e configurar o stream
			#$audio.stream = seErrado
			# Tocar o áudio
			#$audio.play()
		
	else:
		# Verificar se o som está ativado
		if GlobalName.som == true:
			# Acessar o nó AudioStreamPlayer e configurar o stream
			$audio.stream = acerto
			# Tocar o áudio
			$audio.play()
		
		# Desabilitar o clique após todos os objetos estarem certos
		$trMesa/trObj1/btnObj1.disabled = true
		$trMesa/trObj2/btnObj2.disabled = true
		$trMesa/trObj3/btnObj3.disabled = true
		
		$Timer.start()

# Função do botão do primeiro objeto
func btnObj1() -> void:
	if obj1 < 2:
		obj1 += 1
	else:
		obj1 = 0
	mudar()
	verificar()

# Função do botão do segundo objeto
func btnObj2() -> void:
	if obj2 < 2:
		obj2 += 1
	else:
		obj2 = 0
	mudar()
	verificar()

# Função do botão do terceiro objeto
func btnObj3() -> void:
	if obj3 < 2:
		obj3 += 1
	else:
		obj3 = 0
	mudar()
	verificar()

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
	$trTextoDica.visible = false
	$containerAtividade/containerTexto/lblTexto.text = txtDica
	$trDica.visible = false

# Botão de Reiniciar
func btnDenovo():
	var _restart: bool = get_tree().change_scene_to_file("res://scenes/salaMesa.tscn")

# Botão Continuar
func btnContinuar():
	var _continue: bool = get_tree().change_scene_to_file("res://scenes/salaTV.tscn")

# Botão de começar
func btnComecar() -> void:
	$containerAtividade.visible = false
	$trDica.visible = true
	$trTextoDica.visible = true
	$trMesa/trObj1.visible = true
	$trMesa/trObj2.visible = true
	$trMesa/trObj3.visible = true

# Função timer
func _on_timer_timeout() -> void:
	# Exibir o resultado
	$trTextoDica.visible = false
	$trDica.visible = false
	$containerAtividade.visible = true
	$containerAtividade/trComecar.visible = false
	$containerAtividade/trVoltar.visible = false
	$containerAtividade/trDenovo.visible = true
	$containerAtividade/trContinuar.visible = true
	$containerAtividade/containerTexto/lblTexto.text = "Parabéns " + GlobalName.nomeBanco + "!\nVocê completou esta atividade! Gostaria de começar a próxima?"
