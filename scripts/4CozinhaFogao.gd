extends Control

# Textos exibidos
var txtDica:String = "Aperte nos objetos e depois guarde eles no armário!"

var qntAcertos:int = 0
var qntAlvo:int = 4

var toalha:bool = false
var oleo:bool = false
var esponja:bool = false
var papel:bool = false

var seErrado = preload("res://assets/sons/erro sound effect.wav")
var seCerto = preload("res://assets/sons/som de certo.mp3")
var balcao = preload("res://assets/sons/porta fechando.mp3")

# Carregando as texturas padrão
var dftToalha = preload("res://assets/cozinha/Toalhas Fogao Cozinha.png")
var dftOleo = preload("res://assets/cozinha/Oleo Cozinha.png")
var dftEsponja = preload("res://assets/cozinha/Esponja Fogao Cozinha.png")
var dftPapel = preload("res://assets/cozinha/Papel Fogao Cozinha.png")

# Carregando as texturas selecionadas
var sltToalha = preload("res://assets/cozinha/Toalhas Fogao Cozinha Selecionada.png")
var sltOleo = preload("res://assets/cozinha/Oleo Cozinha Selecionado.png")
var sltEsponja = preload("res://assets/cozinha/Esponja Fogao Cozinha Selecionada.png")
var sltPapel = preload("res://assets/cozinha/Papel Fogao Cozinha Selecionado.png")

# Função executada ao iniciar a cena
func _ready() -> void:
	# Tornar visível o container de explicação
	$containerAtividade.visible = true
	$containerAtividade/containerTexto/lblTexto.text = "Bem vindo à cozinha " + GlobalName.nomeBanco + "!\nTem coisas muito perigosas perto do fogão!\nQue tal tirar esses objetos de perto dele?"
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
	
	# Desabilita o botão do balcão
	$trFundo/trBalcao/btnBalcao.disabled = true

# Verificar a seleção
func verificarSelecao():
	# Toalha selecionada
	if toalha == true:
		$trFundo/trBalcao/trToalha.texture = sltToalha
		
		$trFundo/trBalcao/trOleo.texture = dftOleo
		$trFogao/trEsponja.texture = dftEsponja
		$trFogao/trPapel.texture = dftPapel
	
	# Oleo selecionado
	elif oleo == true:
		$trFundo/trBalcao/trOleo.texture = sltOleo
		
		$trFundo/trBalcao/trToalha.texture = dftToalha
		$trFogao/trEsponja.texture = dftEsponja
		$trFogao/trPapel.texture = dftPapel
	
	# Esponja selecionada
	elif esponja == true:
		$trFogao/trEsponja.texture = sltEsponja
		
		$trFundo/trBalcao/trToalha.texture = dftToalha
		$trFundo/trBalcao/trOleo.texture = dftOleo
		$trFogao/trPapel.texture = dftPapel
	
	# Papel selecionado
	else:
		$trFogao/trPapel.texture = sltPapel
		
		$trFundo/trBalcao/trToalha.texture = dftToalha
		$trFundo/trBalcao/trOleo.texture = dftOleo
		$trFogao/trEsponja.texture = dftEsponja
	
	# Exibe a dica do balcão
	$trFundo/trBalcao.texture = load("res://assets/cozinha/Balcao Cozinha Clicar.png")
	# Habilita o botão do balcão
	$trFundo/trBalcao/btnBalcao.disabled = false

# Função do Objeto Toalha
func btnToalha() -> void:
	# Ativar objeto atual
	toalha = true
	
	# Desativar demais objetos
	oleo = false
	esponja = false
	papel = false
	
	verificarSelecao()

# Função do Objeto Oleo
func btnOleo() -> void:
	# Ativar objeto atual
	oleo = true
	
	# Desativar demais objetos
	toalha = false
	esponja = false
	papel = false
	
	verificarSelecao()

# Função do Objeto Esponja
func btnEsponja() -> void:
	# Ativar objeto atual
	esponja = true
	
	# Desativar demais objetos
	toalha = false
	oleo = false
	papel = false
	
	verificarSelecao()

# Função do Objeto Papel
func btnPapel() -> void:
	# Ativar objeto atual
	papel = true
	
	# Desativar demais objetos
	toalha = false
	oleo = false
	esponja = false
	
	verificarSelecao()

# Verificar Acertos
func verificarAcertos():
	if qntAcertos == qntAlvo:
		$Timer.start()

# Função de quando um objeto é guardado
func colocarObj():
	qntAcertos += 1
	$audio.stream = balcao
	$audio.play()

# Função do Balcão
func btnBalcao():
	# Verificar qual objeto foi selecionado
	if toalha == true:
		# Ocultar o objeto
		$trFundo/trBalcao/trToalha.visible = false
		colocarObj()
		
	elif oleo == true:
		# Ocultar o objeto
		$trFundo/trBalcao/trOleo.visible = false
		colocarObj()
	
	elif esponja == true:
		# Ocultar o objeto
		$trFogao/trEsponja.visible = false
		colocarObj()
	
	elif papel == true:
		# Ocultar o objeto
		$trFogao/trPapel.visible = false
		colocarObj()
	
	# Exibe a dica do balcão
	$trFundo/trBalcao.texture = load("res://assets/cozinha/Balcao Cozinha.png")
	# Desabilita o botão do balcão
	$trFundo/trBalcao/btnBalcao.disabled = true
	
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

# Botão de Reiniciar
func btnDenovo():
	var _restart: bool = get_tree().change_scene_to_file("res://scenes/cozinhaFogao.tscn")

# Botão Continuar
func btnContinuar():
	SqlController.carregar_progresso("fase2Completa","0")

# Botão de começar
func btnComecar() -> void:
	$containerAtividade.visible = false
	$trDica.visible = true
	$trTextoDica.visible = true

# Quando o timer acabar
func _on_timer_timeout() -> void:
	# Mostrar a tela de conclusão
	$containerAtividade.visible = true
	$containerAtividade/containerTexto/lblTexto.text = "Parabéns " + GlobalName.nomeBanco + "! Você completou a cozinha! Que tal voltar e escolher outro cômodo?"
	$containerAtividade/trDenovo.visible = true
	$containerAtividade/trContinuar.visible = true
	
	# Ocultar botoes do inicio
	$containerAtividade/trComecar.visible = false
	$containerAtividade/trVoltar.visible = false
	$trDica.visible = false
	$trTextoDica.visible = false
