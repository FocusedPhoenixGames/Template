extends AudioStreamPlayer

@export var songs: Array[AudioStream]


func play_music(song: int) -> void:
	if songs == null || songs.size() == 0:
		return
	
	stream = songs[song]
	play()
