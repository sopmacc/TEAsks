extends Control

# Textos exibidos
var txtDica:String = "Aperte nos objetos que estão diferentes da imagem da esquerda!"
var txtFim:String = "Parabéns! Você completou o quarto! Que tal voltar e escolher outro cômodo?"

var qntAlvo:int = 7
var qntEncontrada:int = 0
var acerto = preload("res://assets/sons/som de certo.mp3")
var marcacao = preload("res://assets/quarto/Acerto 7 erros.png")

# Função executada ao iniciar a cena
func _ready() -> void:
	# Tornar visível o container de explicação
	$containerAtividade.visible = true
	$containerAtividade/containerTexto/lblTexto.text = "Vamos brincar de 7 erros " + GlobalName.nomeBanco + "? É simples, encontre as diferenças entre as duas mesas e aperte em cima!"
	$containerAtividade/trComecar.visible = true
	$containerAtividade/trVoltar.visible = true
	
	# Ocultar botoes do final
	$containerAtividade/trDenovo.visible = false
	$containerAtividade/trContinuar.visible = false
	
	# Interface
	$trDica.visible = false
	$trTextoDica.visible = false
	$trLadoCerto.visible = false
	$trLadoErrado.visible = false
	
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

# Verificar Acertos
func verificarAcertos():
	$trTextoDica/Label.text = str(qntEncontrada)+"/7"
	if qntEncontrada == qntAlvo:
		$Timer.start()

# Erro 1 do relógio
func btnRE1() -> void:
	# Aumenta a quantidade encontrada
	qntEncontrada += 1
	# Desabilita o Botão
	$mesaErrada/trRE1/btnRE1.disabled = true
	$mesaErrada/trRE1.texture = marcacao
	somAcerto()
	verificarAcertos()

# Erro 2 do relógio
func btnRE2() -> void:
	# Aumenta a quantidade encontrada
	qntEncontrada += 1
	# Desabilita o Botão
	$mesaErrada/trRE2/btnRE2.disabled = true
	$mesaErrada/trRE2.texture = marcacao
	somAcerto()
	verificarAcertos()

# Erro 1 da Luminária
func btnLE1() -> void:
	# Aumenta a quantidade encontrada
	qntEncontrada += 1
	# Desabilita o Botão
	$mesaErrada/trLE1/btnLE1.disabled = true
	$mesaErrada/trLE1.texture = marcacao
	somAcerto()
	verificarAcertos()

# Erro 2 da Luminária
func btnLE2() -> void:
	# Aumenta a quantidade encontrada
	qntEncontrada += 1
	# Desabilita o Botão
	$mesaErrada/trLE2/btnLE2.disabled = true
	$mesaErrada/trLE2.texture = marcacao
	somAcerto()
	verificarAcertos()

# Erro da Moldura
func btnME() -> void:
	# Aumenta a quantidade encontrada
	qntEncontrada += 1
	# Desabilita o Botão
	$mesaErrada/trME/btnME.disabled = true
	$mesaErrada/trME.texture = marcacao
	somAcerto()
	verificarAcertos()

# Erro da Planta
func btnPE() -> void:
	# Aumenta a quantidade encontrada
	qntEncontrada += 1
	# Desabilita o Botão
	$mesaErrada/trPE/btnPE.disabled = true
	$mesaErrada/trPE.texture = marcacao
	somAcerto()
	verificarAcertos()

# Erro do Copo
func btnCE() -> void:
	# Aumenta a quantidade encontrada
	qntEncontrada += 1
	# Desabilita o Botão
	$mesaErrada/trCE/btnCE.disabled = true
	$mesaErrada/trCE.texture = marcacao
	somAcerto()
	verificarAcertos()

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
	$trLadoCerto.visible = false
	$trLadoErrado.visible = false

# Botão de Reiniciar
func btnDenovo():
	var _restart: bool = get_tree().change_scene_to_file("res://scenes/quartoMesa.tscn")

# Botão Continuar
func btnContinuar():
	SqlController.carregar_progresso("fase4Completa","0")

# Botão de começar
func btnComecar() -> void:
	$containerAtividade.visible = false
	$trDica.visible = true
	$trTextoDica.visible = true
	$trLadoCerto.visible = true
	$trLadoErrado.visible = true

# Quando o timer acabar
func _on_timer_timeout() -> void:
	# Mostrar a tela de conclusão
	$containerAtividade.visible = true
	$containerAtividade/containerTexto/lblTexto.text = "Parabéns " + GlobalName.nomeBanco + "! Você completou o quarto! Que tal voltar e escolher outro cômodo?"
	$containerAtividade/trDenovo.visible = true
	$containerAtividade/trContinuar.visible = true
	
	# Ocultar botoes do inicio
	$containerAtividade/trComecar.visible = false
	$containerAtividade/trVoltar.visible = false
	$trDica.visible = false
	$trTextoDica.visible = false
	$trLadoCerto.visible = false
	$trLadoErrado.visible = false
