extends Node
tool

const USER_PREFERENCES_SECTION_NAME = "graphics"

signal graphics_changed

var set_settings_value: FuncRef = FuncRef.new()
var get_settings_value: FuncRef = FuncRef.new()
var save_settings: FuncRef = FuncRef.new()

var msaa: int = Viewport.MSAA_DISABLED setget set_msaa
var shadow_atlas_size: int = 0
var shadow_atlas_quad_3: int = 0
var shadow_atlas_quad_2: int = 0
var shadow_atlas_quad_1: int = 0
var shadow_atlas_quad_0: int = 0
var shadow_filter_mode: int = 0 setget set_shadow_filter_mode
var sss_follow_surface: bool = false setget set_sss_follow_surface
var sss_weight_samples: int = 0 setget set_sss_weight_samples 
var sss_quality: int = 0 setget set_sss_quality
var sss_scale: float = 0 setget set_sss_scale
var vct_high: bool = 0 setget set_vct_high

# MSAA
func set_msaa(p_msaa: int) -> void:
	if msaa != p_msaa:
		msaa = p_msaa
		emit_signal("graphics_changed")
		
# Shadows
func set_shadow_atlas_size(p_shadow_atlas_size: int) -> void:
	if shadow_atlas_size != p_shadow_atlas_size:
		shadow_atlas_size = p_shadow_atlas_size
		emit_signal("graphics_changed")
		
func set_shadow_atlas_quad_3(p_shadow_atlas_quad_3: int) -> void:
	if shadow_atlas_quad_3 != p_shadow_atlas_quad_3:
		shadow_atlas_quad_3 = shadow_atlas_quad_3
		emit_signal("graphics_changed")
		
func set_shadow_atlas_quad_2(p_shadow_atlas_quad_2: int) -> void:
	if shadow_atlas_quad_2 != p_shadow_atlas_quad_2:
		shadow_atlas_quad_2 = shadow_atlas_quad_2
		emit_signal("graphics_changed")
		
func set_shadow_atlas_quad_1(p_shadow_atlas_quad_1: int) -> void:
	if shadow_atlas_quad_1 != p_shadow_atlas_quad_1:
		shadow_atlas_quad_1 = shadow_atlas_quad_1
		emit_signal("graphics_changed")
		
func set_shadow_atlas_quad_0(p_shadow_atlas_quad_0: int) -> void:
	if shadow_atlas_quad_0 != p_shadow_atlas_quad_0:
		shadow_atlas_quad_0 = shadow_atlas_quad_0
		emit_signal("graphics_changed")

func set_shadow_filter_mode(p_mode: int) -> void:
	if shadow_filter_mode != p_mode:
		shadow_filter_mode = p_mode
		ProjectSettings.set_setting("rendering/quality/shadows/filter_mode", shadow_filter_mode)
		emit_signal("graphics_changed")
		
# Subsurface Scattering
func set_sss_follow_surface(p_follow_surface: bool) -> void:
	if sss_follow_surface != p_follow_surface:
		sss_follow_surface = p_follow_surface
		ProjectSettings.set_setting("rendering/quality/subsurface_scattering/follow_surface", sss_follow_surface)
		emit_signal("graphics_changed")

func set_sss_weight_samples(p_sss_weight_samples: int) -> void:
	if sss_weight_samples != p_sss_weight_samples:
		sss_weight_samples = p_sss_weight_samples
		ProjectSettings.set_setting("rendering/quality/subsurface_scattering/weight_samples", sss_weight_samples)
		emit_signal("graphics_changed")
		
func set_sss_quality(p_sss_quality: int) -> void:
	if sss_quality != p_sss_quality:
		sss_quality = p_sss_quality
		ProjectSettings.set_setting("rendering/quality/subsurface_scattering/quality", sss_quality)
		emit_signal("graphics_changed")
		
func set_sss_scale(p_sss_scale: float) -> void:
	if sss_scale != p_sss_scale:
		sss_scale = p_sss_scale
		ProjectSettings.set_setting("rendering/size/subsurface_scattering/size", sss_scale)
		emit_signal("graphics_changed")
		
func set_vct_high(p_vct_high: bool) -> void:
	if vct_high != p_vct_high:
		vct_high = p_vct_high
		ProjectSettings.set_setting("rendering/size/voxel_cone_tracing/high_quality", vct_high)
		emit_signal("graphics_changed")

func set_settings_value(p_key: String, p_value) -> void:
	if set_settings_value.is_valid():
		set_settings_value.call_func(USER_PREFERENCES_SECTION_NAME, p_key, p_value)

func set_settings_values():
	set_settings_value("msaa", msaa)
	
	set_settings_value("shadow_atlas_size", shadow_atlas_size)
	set_settings_value("shadow_atlas_quad_3", shadow_atlas_quad_3)
	set_settings_value("shadow_atlas_quad_2", shadow_atlas_quad_2)
	set_settings_value("shadow_atlas_quad_1", shadow_atlas_quad_1)
	set_settings_value("shadow_atlas_quad_0", shadow_atlas_quad_0)
	set_settings_value("shadow_filter_mode", shadow_filter_mode)
	
	set_settings_value("subsurface_scattering_follow_surface", sss_follow_surface)
	set_settings_value("subsurface_scattering_weight_samples", sss_weight_samples)
	set_settings_value("subsurface_scattering_quality", sss_quality)
	set_settings_value("subsurface_scattering_scale", sss_scale)
	
	set_settings_value("voxel_cone_tracing_high_quality", vct_high)

func get_settings_value(p_key: String, p_type: int, p_default):
	if get_settings_value.is_valid():
		return get_settings_value.call_func(USER_PREFERENCES_SECTION_NAME, p_key, p_type, p_default)
	else:
		return p_default

func get_settings_values() -> void:
	msaa = get_settings_value("msaa", TYPE_INT, msaa)
	
	shadow_atlas_size = get_settings_value("shadow_atlas_size", TYPE_INT, shadow_atlas_size)
	shadow_atlas_quad_3 = get_settings_value("shadow_atlas_quad_3", TYPE_INT, shadow_atlas_quad_3)
	shadow_atlas_quad_2 = get_settings_value("shadow_atlas_quad_2", TYPE_INT, shadow_atlas_quad_2)
	shadow_atlas_quad_1 = get_settings_value("shadow_atlas_quad_1", TYPE_INT, shadow_atlas_quad_1)
	shadow_atlas_quad_0 = get_settings_value("shadow_atlas_quad_0", TYPE_INT, shadow_atlas_quad_0)
	shadow_filter_mode = get_settings_value("shadow_filter_mode", TYPE_INT, shadow_filter_mode)

	sss_follow_surface = get_settings_value("subsurface_scattering_follow_surface", TYPE_BOOL, sss_follow_surface)
	sss_weight_samples = get_settings_value("subsurface_scattering_weight_samples", TYPE_INT, sss_weight_samples)
	sss_quality = get_settings_value("subsurface_scattering_quality", TYPE_INT, sss_quality)
	sss_scale = get_settings_value("subsurface_scattering_scale", TYPE_REAL, sss_scale)

	vct_high = get_settings_value("voxel_cone_tracing_high_quality", TYPE_BOOL, vct_high)

func is_quitting() -> void:
	set_settings_values()

func assign_set_settings_value_funcref(p_instance: Object, p_function: String) -> void:
	set_settings_value.set_instance(p_instance)
	set_settings_value.set_function(p_function)
	
func assign_get_settings_value_funcref(p_instance: Object, p_function: String) -> void:
	get_settings_value.set_instance(p_instance)
	get_settings_value.set_function(p_function)
	
func assign_save_settings_funcref(p_instance: Object, p_function: String) -> void:
	save_settings.set_instance(p_instance)
	save_settings.set_function(p_function)
	
func _ready():
	# Antialiasing
	msaa =\
	ProjectSettings.get_setting("rendering/quality/filters/msaa")
	
	#Shadows 
	shadow_atlas_size =\
	ProjectSettings.get_setting("rendering/quality/shadow_atlas/size")
	shadow_atlas_quad_3 =\
	ProjectSettings.get_setting("rendering/quality/shadow_atlas/quadrant_3_subdiv")
	shadow_atlas_quad_2 =\
	ProjectSettings.get_setting("rendering/quality/shadow_atlas/quadrant_2_subdiv")
	shadow_atlas_quad_1 =\
	ProjectSettings.get_setting("rendering/quality/shadow_atlas/quadrant_1_subdiv")
	shadow_atlas_quad_0 =\
	ProjectSettings.get_setting("rendering/quality/shadow_atlas/quadrant_0_subdiv")
	shadow_filter_mode =\
	ProjectSettings.get_setting("rendering/quality/shadows/filter_mode")
	
	# Subsurface scattering
	sss_follow_surface =\
	ProjectSettings.get_setting("rendering/quality/subsurface_scattering/follow_surface")
	sss_weight_samples =\
	ProjectSettings.get_setting("rendering/quality/subsurface_scattering/weight_samples")
	sss_quality =\
	ProjectSettings.get_setting("rendering/quality/subsurface_scattering/quality")
	sss_scale =\
	ProjectSettings.get_setting("rendering/quality/subsurface_scattering/scale")
	
	# Voxel cone tracing
	vct_high =\
	ProjectSettings.get_setting("rendering/quality/voxel_cone_tracing/high_quality")
