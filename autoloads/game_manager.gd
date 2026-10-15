# game_manager.gd
extends Node
var bg_input_blocked = false;
# An array matching the exact order of your TimeOfDay enum
var time_labels: Array[String] = [
	"Early Morning",
	"Morning",
	"Lunch",
	"Afternoon",
	"Evening",
	"Night",
	"Late Night"
]

# Player Stats
var study_score: int = 0:
	set(value):
		study_score = clamp(value, 0, 100)
		stats_changed.emit()

var social_score: int = 0:
	set(value):
		social_score = clamp(value, 0, 100)
		stats_changed.emit()

var happiness: int = 0:
	set(value):
		happiness = clamp(value, 0, 100)
		stats_changed.emit()

var hunger: float = 80:
	set(value):
		hunger = clamp(value, 0, 100)
		stats_changed.emit()

var rest: float = 80:
	set(value):
		rest = clamp(value, 0, 100)
		stats_changed.emit()

var hygiene: float = 80:
	set(value):
		hygiene = clamp(value, 0, 100)
		stats_changed.emit()

var money: float = 250.0:
	set(value):
		money = max(0.0, value) # Money can't go below 0, but can exceed 100
		stats_changed.emit()

# Friends & Attendance
var friend_count: int = 2
var friendship_health: float = 1.0 # Multiplier (0.5 to 1.5)
var skips_count: int = 0
var max_skips_allowed: int = 5 # before getting deported

# Time System State
enum TimeOfDay { EARLY_MORNING, MORNING, LUNCH, AFTERNOON, EVENING, NIGHT, LATE_NIGHT }
var current_time: TimeOfDay = TimeOfDay.EARLY_MORNING
var current_day: int = 1
var is_deported: bool = false

# Signal to update UI automatically whenever stats shift
signal stats_changed
signal time_changed

# Dialogue Signal
signal dialogue_free_time_start
signal dialogue_main_start

func update_stat(stat_name: String, amount: float) -> void:
	# Adjust stats and clamp them between 0 and 100
	set(stat_name, clamp(get(stat_name) + amount, 0, 100))
	stats_changed.emit()
	
func advance_time_slot() -> void:
	print("SKIP")
	hygiene -= 10
	hunger -= 10
	rest -= 10
	
	if skips_count >= max_skips_allowed:
		#trigger_deportation_ending()
		return
	
	# Increment time slot
	if current_time == TimeOfDay.LATE_NIGHT:
		current_time = TimeOfDay.EARLY_MORNING
		current_day += 1
		update_daily_happiness() # Recalculate Hunger/Hygiene losses each new day
	else:
		current_time = (current_time + 1) as TimeOfDay
	
	time_changed.emit() # Update first
	stats_changed.emit()

func update_daily_happiness() -> void:
	# Happiness recalculation based on your rules
	var daily_wellbeing = (rest + hunger + hygiene) / 3 / 100 * 4 # Happiness formula. 
	# 75% average, 3 points.
	happiness += int(daily_wellbeing * (1.0 + (friend_count * 0.05))) # friendship boost

func change_scene(pathToScene) -> void:
	get_tree().change_scene_to_file(pathToScene)
	
func set_time_slot(timeOfDay) -> void:
	current_time = timeOfDay
	time_changed.emit()
	
