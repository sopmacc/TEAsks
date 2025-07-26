extends Control

# Textos exibidos
var txtDica:String = "Aperte nas roupas e depois aperte na sombra correspondente!"

var qntAcertos:int = 0
var qntAlvo:int = 5

var obj1:bool = false
var obj2:bool = false
var obj3:bool = false
var obj4:bool = false
var obj5:bool = false

# Carregando as texturas padrão
var dftObj1 = preload("res://assets/quarto/Roupa 1 Quarto.png")
var dftObj2 = preload("res://assets/quarto/Roupa 2 Quarto.png")
var dftObj3 = preload("res://assets/quarto/Roupa 3 Quarto.png")
var dftObj4 = preload("res://assets/quarto/Roupa 4 Quarto.png")
var dftObj5 = preload("res://assets/quarto/Roupa 5 Quarto.png")

# Carregando as texturas selecionadas
var sltObj1 = preload("res://assets/quarto/Roupa 1 Quarto Selecionada.png")
var sltObj2 = preload("res://assets/quarto/Roupa 2 Quarto Selecionada.png")
var sltObj3 = preload("res://assets/quarto/Roupa 3 Quarto Selecionada.png")
var sltObj4 = preload("res://assets/quarto/Roupa 4 Quarto Selecionada.png")
var sltObj5 = preload("res://assets/quarto/Roupa 5 Quarto Selecionada.png")

var seErrado = preload("res://assets/sons/erro sound effect.wav")
var acerto = preload("res://assets/sons/som de certo.mp3")

# Função executada ao iniciar a cena
func _ready():
	# Tornar visível o container de explicação
	$containerAtividade.visible = true
	$containerAtividade/containerTexto/lblTexto.text = "Bem vindo ao quarto " + GlobalName.nomeBanco + "!\nAqui você deve colocar as roupas no lugar. selecione a roupa e depois aperte onde ela deve ficar!\nVamos lá?"
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
	# Caso obj1 seja clicado
	if obj1 == true:
		$trGuardaRoupa/trObj1.texture = sltObj1
		
		$trGuardaRoupa/trObj2.texture = dftObj2
		$trGuardaRoupa/trObj3.texture = dftObj3
		$trGuardaRoupa/trObj4.texture = dftObj4
		$trGuardaRoupa/trObj5.texture = dftObj5
	
	# Caso obj2 seja clicado
	elif obj2 == true:
		$trGuardaRoupa/trObj2.texture = sltObj2
		
		$trGuardaRoupa/trObj1.texture = dftObj1
		$trGuardaRoupa/trObj3.texture = dftObj3
		$trGuardaRoupa/trObj4.texture = dftObj4
		$trGuardaRoupa/trObj5.texture = dftObj5
	
	# Caso obj3 seja clicado
	elif obj3 == true:
		$trGuardaRoupa/trObj3.texture = sltObj3
		
		$trGuardaRoupa/trObj1.texture = dftObj1
		$trGuardaRoupa/trObj2.texture = dftObj2
		$trGuardaRoupa/trObj4.texture = dftObj4
		$trGuardaRoupa/trObj5.texture = dftObj5
	
	# Caso obj4 seja clicado
	elif obj4 == true:
		$trGuardaRoupa/trObj4.texture = sltObj4
		
		$trGuardaRoupa/trObj1.texture = dftObj1
		$trGuardaRoupa/trObj2.texture = dftObj2
		$trGuardaRoupa/trObj3.texture = dftObj3
		$trGuardaRoupa/trObj5.texture = dftObj5
	
	# Caso obj5 seja clicado
	else:
		$trGuardaRoupa/trObj5.texture = sltObj5
		
		$trGuardaRoupa/trObj1.texture = dftObj1
		$trGuardaRoupa/trObj2.texture = dftObj2
		$trGuardaRoupa/trObj3.texture = dftObj3
		$trGuardaRoupa/trObj4.texture = dftObj4

# Função do Objeto 1
func btnObj1() -> void:
	# Ativar objeto atual
	obj1 = true
	
	# Desativar demais objetos
	obj2 = false
	obj3 = false
	obj4 = false
	obj5 = false
	
	verificarSelecao()

# Função do Objeto 2
func btnObj2() -> void:
	# Ativar objeto atual
	obj2 = true
	
	# Desativar demais objetos
	obj1 = false
	obj3 = false
	obj4 = false
	obj5 = false
	
	verificarSelecao()

# Função do Objeto 3
func btnObj3() -> void:
	# Ativar objeto atual
	obj3 = true
	
	# Desativar demais objetos
	obj1 = false
	obj2 = false
	obj4 = false
	obj5 = false
	
	verificarSelecao()

# Função do Objeto 4
func btnObj4() -> void:
	# Ativar objeto atual
	obj4 = true
	
	# Desativar demais objetos
	obj1 = false
	obj2 = false
	obj3 = false
	obj5 = false
	
	verificarSelecao()

# Função do Objeto 5
func btnObj5() -> void:
	# Ativar objeto atual
	obj5 = true
	
	# Desativar demais objetos
	obj1 = false
	obj2 = false
	obj3= false
	obj4 = false
	
	verificarSelecao()

# Verificar Acertos
func verificarAcertos():
	print(qntAcertos)
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
		$trGuardaRoupa/trObj1.visible = false
		
		# Muda a sombra
		$trGuardaRoupa/trSombra1.texture = dftObj1
		$trGuardaRoupa/trSombra1/btnSombra1.disabled = true
		
		somAcerto()
	
	# Se tiver selecionado errado
	if obj2 == true or obj3 == true or obj4 == true or obj5 == true:
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
		$trGuardaRoupa/trObj2.visible = false
		
		# Muda a sombra
		$trGuardaRoupa/trSombra2.texture = dftObj2
		$trGuardaRoupa/trSombra2/btnSombra2.disabled = true
		
		somAcerto()
	
	# Se tiver selecionado errado
	if obj1 == true or obj3 == true or obj4 == true or obj5 == true:
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
		$trGuardaRoupa/trObj3.visible = false
		
		# Muda a sombra
		$trGuardaRoupa/trSombra3.texture = dftObj3
		$trGuardaRoupa/trSombra3/btnSombra3.disabled = true
		
		somAcerto()
	
	# Se tiver selecionado errado
	if obj1 == true or obj2 == true or obj4 == true or obj5 == true:
		somErro()

# Função da Sombra 4
func btnSombra4():
	# Verifica se o objeto correspondente está selecionado
	if obj4 == true:
		# Aumenta a quantidade de acertos
		qntAcertos += 1
		
		# Verifica se o minigame foi concluido
		verificarAcertos()
		
		# Oculta o objeto correto
		$trGuardaRoupa/trObj4.visible = false
		
		# Muda a sombra
		$trGuardaRoupa/trSombra4.texture = dftObj4
		$trGuardaRoupa/trSombra4/btnSombra4.disabled = true
		
		somAcerto()
	
	# Se tiver selecionado errado
	if obj1 == true or obj2 == true or obj3 == true or obj5 == true:
		somErro()

# Função da Sombra 5
func btnSombra5():
	# Verifica se o objeto correspondente está selecionado
	if obj5 == true:
		# Aumenta a quantidade de acertos
		qntAcertos += 1
		
		# Verifica se o minigame foi concluido
		verificarAcertos()
		
		# Oculta o objeto correto
		$trGuardaRoupa/trObj5.visible = false
		
		# Muda a sombra
		$trGuardaRoupa/trSombra5.texture = dftObj5
		$trGuardaRoupa/trSombra5/btnSombra5.disabled = true
		
		somAcerto()
	
	# Se tiver selecionado errado
	if obj1 == true or obj2 == true or obj3 == true or obj4 == true:
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
	var _restart: bool = get_tree().change_scene_to_file("res://scenes/quartoRoupa.tscn")

# Botão Continuar
func btnContinuar():
	var _continue: bool = get_tree().change_scene_to_file("res://scenes/quartoMesa.tscn")

# Botão de começar
func btnComecar() -> void:
	$containerAtividade.visible = false
	$trDica.visible = true
	$trTextoDica.visible = true

# Quando o timer acabar
func _on_timer_timeout() -> void:
	# Mostrar a tela de conclusão
	$containerAtividade.visible = true
	$containerAtividade/containerTexto/lblTexto.text = "Parabéns " + GlobalName.nomeBanco + "!\nVocê completou esta atividade! Gostaria de começar a próxima?"
	$containerAtividade/trDenovo.visible = true
	$containerAtividade/trContinuar.visible = true
	
	# Ocultar botoes do inicio
	$containerAtividade/trComecar.visible = false
	$containerAtividade/trVoltar.visible = false
	$trDica.visible = false
	$trTextoDica.visible = false
