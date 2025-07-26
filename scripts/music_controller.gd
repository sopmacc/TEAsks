extends Control

func pararmusica():
	$AudioStreamPlayer.playing = false

func tocarmusica():
	$AudioStreamPlayer.playing = true
