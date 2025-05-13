obs = obslua

-- Returns the description displayed in the Scripts window
function script_description()
  return [[<center><h2>File Window Filter</h2></center>
  <p>This Lua script adds a filter named <it>File Window</it>. The filter can be added
  to a source to render a file window overlay. It also includes custom text on top.</p>]]
end

-- Called on script startup
function script_load(settings)
  obs.obs_register_source(source_info)
  obs.blog(obs.LOG_INFO, "plugin loaded successfully")
end

-- Definition of the global variable containing the source_info structure
source_info = {}
source_info.id = 'filter-file-window'           -- Unique string identifier of the source type
source_info.type = obs.OBS_SOURCE_TYPE_FILTER   -- INPUT or FILTER or TRANSITION
source_info.output_flags = obs.OBS_SOURCE_VIDEO -- Combination of VIDEO/AUDIO/ASYNC/etc

-- Returns the name displayed in the list of filters
source_info.get_name = function()
  return "File Window"
end

-- Creates the implementation data for the source
source_info.create = function (settings, source)

  -- Initializes the custom data table
  local data = {}
  data.source = source  -- Keeps a reference to this filter as a source object
  data.width = 1        -- Dummy value during initialization phase
  data.height = 1       -- Dummy value during initialization phase
  data.ui_length = 1    -- Dummy value during initialization phase
  data.text_length = 1  -- Dummy value during initialization phase
  data.width_ratio = 1  -- Dummy value during initialization phase
  data.height_ratio = 1 -- Dummy value during initialization phase
  data.text_ratio = 1   -- Dummy value during initialization phase

  -- Compiles the effect
  obs.obs_enter_graphics()
  local effect_file_path = script_path() .. 'window.effect'
  data.effect = obs.gs_effect_create_from_file(effect_file_path, nil)

  local ui_file_path = script_path() .. 'ui_left.png'
  data.ui_left = obs.gs_texture_create_from_file(ui_file_path)

  ui_file_path = script_path() .. 'ui_topleft.png'
  data.ui_topleft = obs.gs_texture_create_from_file(ui_file_path)

  ui_file_path = script_path() .. 'ui_top.png'
  data.ui_top = obs.gs_texture_create_from_file(ui_file_path)

  ui_file_path = script_path() .. 'ui_topright.png'
  data.ui_topright = obs.gs_texture_create_from_file(ui_file_path)

  ui_file_path = script_path() .. 'ui_right.png'
  data.ui_right = obs.gs_texture_create_from_file(ui_file_path)

  ui_file_path = script_path() .. 'ui_bottomright.png'
  data.ui_bottomright = obs.gs_texture_create_from_file(ui_file_path)

  ui_file_path = script_path() .. 'ui_bottom.png'
  data.ui_bottom = obs.gs_texture_create_from_file(ui_file_path)

  cui_file_path = script_path() .. 'ui_bottomleft.png'
  data.ui_bottomleft = obs.gs_texture_create_from_file(ui_file_path)

  obs.obs_leave_graphics()

  -- Calls the destroy function if the effect or textures was not compiled properly
  if data.effect == nil then
    obs.blog(obs.LOG_ERROR, "Effect compilation failed for " .. effect_file_path)
    source_info.destroy(data)
    return nil
  end

  if data.ui_left == nil then
    obs.blog(obs.LOG_ERROR, "Texture compilation failed for ui_left")
    source_info.destroy(data)
    return nil
  end

  if data.ui_topleft == nil then
    obs.blog(obs.LOG_ERROR, "Texture compilation failed for ui_topleft")
    source_info.destroy(data)
    return nil
  end

  if data.ui_top == nil then
    obs.blog(obs.LOG_ERROR, "Texture compilation failed for ui_top")
    source_info.destroy(data)
    return nil
  end

  if data.ui_topright == nil then
    obs.blog(obs.LOG_ERROR, "Texture compilation failed for ui_topright")
    source_info.destroy(data)
    return nil
  end

  if data.ui_right == nil then
    obs.blog(obs.LOG_ERROR, "Texture compilation failed for ui_right")
    source_info.destroy(data)
    return nil
  end

  if data.ui_bottomright == nil then
    obs.blog(obs.LOG_ERROR, "Texture compilation failed for ui_bottomright")
    source_info.destroy(data)
    return nil
  end

  if data.ui_bottom == nil then
    obs.blog(obs.LOG_ERROR, "Texture compilation failed for ui_bottom")
    source_info.destroy(data)
    return nil
  end

  if data.ui_bottomleft == nil then
    obs.blog(obs.LOG_ERROR, "Texture compilation failed for ui_bottomleft")
    source_info.destroy(data)
    return nil
  end

  -- Retrieves the shader uniform variables
  data.params = {}
  -- data.params.width = obs.gs_effect_get_param_by_name(data.effect, "width")
  -- data.params.height = obs.gs_effect_get_param_by_name(data.effect, "height")

  data.params.ui_left = obs.gs_effect_get_param_by_name(data.effect, "ui_left")
  data.params.ui_topleft = obs.gs_effect_get_param_by_name(data.effect, "ui_topleft")
  data.params.ui_top = obs.gs_effect_get_param_by_name(data.effect, "ui_top")
  data.params.ui_topright = obs.gs_effect_get_param_by_name(data.effect, "ui_topright")
  data.params.ui_right = obs.gs_effect_get_param_by_name(data.effect, "ui_right")
  data.params.ui_bottomright = obs.gs_effect_get_param_by_name(data.effect, "ui_bottomright")
  data.params.ui_bottom = obs.gs_effect_get_param_by_name(data.effect, "ui_bottom")
  data.params.ui_bottomleft = obs.gs_effect_get_param_by_name(data.effect, "ui_bottomleft")

  data.params.width_ratio = obs.gs_effect_get_param_by_name(data.effect, "width_ratio")
  data.params.height_ratio = obs.gs_effect_get_param_by_name(data.effect, "height_ratio")
  data.params.text_ratio = obs.gs_effect_get_param_by_name(data.effect, "text_ratio")

  -- Calls update to initialize the rest of the properties-managed settings
  source_info.update(data, settings)

  return data
end

-- Destroys and release resources linked to the custom data
source_info.destroy = function(data)
  obs.obs_enter_graphics()
  if data.effect ~= nil then
    obs.gs_effect_destroy(data.effect)
    data.effect = nil
  end

  if data.ui_left ~= nil then
    obs.gs_texture_destroy(data.ui_left)
    data.ui_left = nil
  end

  if data.ui_topleft ~= nil then
    obs.gs_texture_destroy(data.ui_topleft)
    data.ui_topleft = nil
  end

  if data.ui_top ~= nil then
    obs.gs_texture_destroy(data.ui_top)
    data.ui_top = nil
  end

  if data.ui_topright ~= nil then
    obs.gs_texture_destroy(data.ui_topright)
    data.ui_topright = nil
  end

  if data.ui_right ~= nil then
    obs.gs_texture_destroy(data.ui_right)
    data.ui_right = nil
  end

  if data.ui_bottomright ~= nil then
    obs.gs_texture_destroy(data.ui_bottomright)
    data.ui_bottomright = nil
  end

  if data.ui_bottom ~= nil then
    obs.gs_texture_destroy(data.ui_bottom)
    data.ui_bottom = nil
  end

  if data.ui_bottomleft ~= nil then
    obs.gs_texture_destroy(data.ui_bottomleft)
    data.ui_bottomleft = nil
  end

  obs.obs_leave_graphics()
end

-- Returns the width of the source
source_info.get_width = function(data)
  return data.width
end

-- Returns the height of the source
source_info.get_height = function(data)
  return data.height
end

-- Called when rendering the source with the graphics subsystem
source_info.video_render = function (data)
  local parent = obs.obs_filter_get_parent(data.source)
  data.width = obs.obs_source_get_width(parent)
  data.height = obs.obs_source_get_height(parent)
  data.ui_length = obs.gs_texture_get_width(data.ui_left)
  data.text_length = obs.gs_texture_get_width(data.ui_top)

  data.width_ratio = data.ui_length / data.width * data.scale
  data.height_ratio = data.ui_length / data.height * data.scale
  data.text_ratio = data.text_length / data.ui_length
  
  obs.obs_source_process_filter_begin(data.source, obs.GS_RGBA, obs.OBS_ALLOW_DIRECT_RENDERING)

  -- Effect parameters initialization goes here

  obs.gs_effect_set_texture(data.params.ui_left, data.ui_left)
  obs.gs_effect_set_texture(data.params.ui_topleft, data.ui_topleft)
  obs.gs_effect_set_texture(data.params.ui_top, data.ui_top)
  obs.gs_effect_set_texture(data.params.ui_topright, data.ui_topright)
  obs.gs_effect_set_texture(data.params.ui_right, data.ui_right)
  obs.gs_effect_set_texture(data.params.ui_bottomright, data.ui_bottomright)
  obs.gs_effect_set_texture(data.params.ui_bottom, data.ui_bottom)
  obs.gs_effect_set_texture(data.params.ui_bottomleft, data.ui_bottomleft)

  obs.gs_effect_set_float(data.params.width_ratio, data.width_ratio)
  obs.gs_effect_set_float(data.params.height_ratio, data.height_ratio)
  obs.gs_effect_set_float(data.params.text_ratio, data.text_ratio)

  obs.obs_source_process_filter_end(data.source, data.effect, data.width, data.height)
end

-- Sets the default settings for this source
source_info.get_defaults = function(settings)
  obs.obs_data_set_default_double(settings, "ui_scale", 1.0)
  obs.obs_data_set_default_string(settings, "ui_text", "popup")
end

-- Gets the property information of this source
source_info.get_properties = function(data)
  local props = obs.obs_properties_create()
  obs.obs_properties_add_float_slider(props, "ui_scale", "Ui Scale", 0.1, 2.0, 0.1)

  return props
end

-- Updates the internal data for this source upon settings change
source_info.update = function(data, settings)
  data.scale = obs.obs_data_get_double(settings, "ui_scale")
end
