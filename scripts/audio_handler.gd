extends Node2D

@export var mute: bool = false

var wind_level: int = 2

var current_ambience: AudioStreamPlayer
var current_music: AudioStreamPlayer


@onready var wind_1: AudioStreamPlayer = $Ambience/Wind_1
@onready var wind_2: AudioStreamPlayer = $Ambience/Wind_2
@onready var wind_3: AudioStreamPlayer = $Ambience/Wind_3


@onready var eerie: AudioStreamPlayer = $Ambience/eerie

#fox
func fox(sfx: int) -> void:
	if sfx == 1:
		$SFX/RegularFoxShiveringAmbience.play()
	elif sfx == 2:
		$"SFX/RegularFoxHappy(helpTheFox)".play()

#deer mimetic
func deer_mimetic(sfx: int) -> void:
	if sfx == 1:
		$"SFX/DeerMimeticEating(introduction)".play()
	elif sfx == 2:
		$"SFX/DeerMimeticKick(checkTheDeer)".play()
	elif sfx == 3:
		$"SFX/DeerMimeticSight(checkTheDeer)".play()
	elif sfx == 4:
		$"SFX/DeerMimeticWalksAway(keepWalking)".play()

#black bear
func bbear(sfx: int) -> void:
	if sfx == 1:
		$"SFX/BlackBear(fight)Sequence".play()
	elif sfx == 2:
		$"SFX/BlackBear(food)Sight".play()
	elif sfx == 3:
		$"SFX/BlackBear(noFood)".play()
	elif sfx == 4:
		$"SFX/BlackBear(playDead)Startled".play()
	elif sfx == 5:
		$"SFX/BlackBear(scareIt)Startled".play()

#sludge
func sludge(sfx: int) -> void:
	if sfx == 1:
		$SFX/NecroticSludgeBabyAmbience.play()
	elif sfx == 2:
		$SFX/NecroticSludgeBabyDeath.play()
	elif sfx == 3:
		$SFX/NecroticSludgeBabyScreech.play()
	elif sfx == 4:
		$SFX/NecroticSludgeMediumAmbience.play()
	elif sfx == 5:
		$SFX/NecroticSludgeMediumAttackSequence.play()
	elif sfx == 6:
		$SFX/NecroticSludgeMediumRoar.play()
	elif sfx == 7:
		$SFX/NecroticSludgeMediumRoar2.play()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_wind_level(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func stop_ambience():
	current_ambience.stop()
	eerie.stop()

func update_wind_level(level: int) -> void:
	if level == 1:
		current_ambience = wind_1
	elif level == 2:
		current_ambience = wind_2
	elif level == 3:
		current_ambience = wind_3
	
	if level > 0:
		current_ambience.play()
	else:
		current_ambience.stop()

func eerie_level(level: int) -> void:
	if level == 0:
		eerie.stop()
	elif level == 1:
		eerie.play()
		eerie.pitch_scale = 1.0
	elif level == 2:
		eerie.pitch_scale = 1.25
	elif level == 3:
		eerie.pitch_scale = 1.75
