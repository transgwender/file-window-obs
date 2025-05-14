obs = obslua

-- Property Variables
ui_left_texture_path = ""
ui_left_texture      = nil
ui_topleft_texture_path = ""
ui_topleft_texture      = nil
ui_top_texture_path = ""
ui_top_texture      = nil
ui_topright_texture_path = ""
ui_topright_texture      = nil
ui_right_texture_path = ""
ui_right_texture      = nil
ui_bottomright_texture_path = ""
ui_bottomright_texture      = nil
ui_bottom_texture_path = ""
ui_bottom_texture      = nil
ui_bottomleft_texture_path = ""
ui_bottomleft_texture      = nil


-- Returns the description displayed in the Scripts window
function script_description()
  return [[<center><h2>File Window Filter</h2></center>
  <p>This Lua script adds a filter named <it>File Window</it>. The filter can be added
  to a source to render a file window overlay. It also includes custom text on top.</p>]]
end

-- Definition of the properties for the entire script module
function script_properties()
  local props = obs.obs_properties_create()

 	obs.obs_properties_add_path(props, "ui_left_texture_path", "Ui Left File", obs.OBS_PATH_FILE, "Images (*.png)", nil)
 	obs.obs_properties_add_path(props, "ui_topleft_texture_path", "Ui Top Left File", obs.OBS_PATH_FILE, "Images (*.png)", nil)
 	obs.obs_properties_add_path(props, "ui_top_texture_path", "Ui Top File", obs.OBS_PATH_FILE, "Images (*.png)", nil)
 	obs.obs_properties_add_path(props, "ui_topright_texture_path", "Ui Top Right File", obs.OBS_PATH_FILE, "Images (*.png)", nil)
 	obs.obs_properties_add_path(props, "ui_right_texture_path", "Ui Right File", obs.OBS_PATH_FILE, "Images (*.png)", nil)
 	obs.obs_properties_add_path(props, "ui_bottomright_texture_path", "Ui Bottom Right File", obs.OBS_PATH_FILE, "Images (*.png)", nil)
 	obs.obs_properties_add_path(props, "ui_bottom_texture_path", "Ui Bottom File", obs.OBS_PATH_FILE, "Images (*.png)", nil)
 	obs.obs_properties_add_path(props, "ui_bottomleft_texture_path", "Ui Bottom Left File", obs.OBS_PATH_FILE, "Images (*.png)", nil)

  return props
end

-- Called when settings are changed
function script_update(settings)
  -- Many steps are necessary to read a picture file, partly to be done in the graphics thread
  -- See https://obsproject.com/docs/reference-libobs-graphics-image-file.html
  -- First checks if the file needs to be read, i.e. if the file path has changed
  
  local path = obs.obs_data_get_string(settings, "ui_left_texture_path")
  if ui_left_texture_path ~= path then
    print("script_update() attempt reload " .. path)
    ui_left_texture_path = path
    -- Checks if another image was previously loaded to free it
    if ui_left_texture ~= nil then
      obs.gs_image_file_free(ui_left_texture)
    end
    -- Reads the new picture from storage and initializes the texture in the GPU
    local image_file = obs.gs_image_file()
    obs.gs_image_file_init(image_file, path)
    if image_file.loaded then
      obs.obs_enter_graphics()
      obs.gs_image_file_init_texture(image_file)
      obs.obs_leave_graphics()
      ui_left_texture = image_file
      print("script_update() success!")
    else
      -- Logs the error if the file cannot be read, except if it was the default value (empty)
      if string.len(path) > 4 then
        print("ERROR: Cannot load image file " .. path)
      end
      obs.gs_image_file_free(image_file)
      ui_left_texture = nil
    end
  end

  local path = obs.obs_data_get_string(settings, "ui_topleft_texture_path")
  if ui_topleft_texture_path ~= path then
    print("script_update() attempt reload " .. path)
    ui_topleft_texture_path = path
    -- Checks if another image was previously loaded to free it
    if ui_topleft_texture ~= nil then
      obs.gs_image_file_free(ui_topleft_texture)
    end
    -- Reads the new picture from storage and initializes the texture in the GPU
    local image_file = obs.gs_image_file()
    obs.gs_image_file_init(image_file, path)
    if image_file.loaded then
      obs.obs_enter_graphics()
      obs.gs_image_file_init_texture(image_file)
      obs.obs_leave_graphics()
      ui_topleft_texture = image_file
      print("script_update() success!")
    else
      -- Logs the error if the file cannot be read, except if it was the default value (empty)
      if string.len(path) > 4 then
        print("ERROR: Cannot load image file " .. path)
      end
      obs.gs_image_file_free(image_file)
      ui_topleft_texture = nil
    end
  end

  local path = obs.obs_data_get_string(settings, "ui_top_texture_path")
  if ui_top_texture_path ~= path then
    print("script_update() attempt reload " .. path)
    ui_top_texture_path = path
    -- Checks if another image was previously loaded to free it
    if ui_top_texture ~= nil then
      obs.gs_image_file_free(ui_top_texture)
    end
    -- Reads the new picture from storage and initializes the texture in the GPU
    local image_file = obs.gs_image_file()
    obs.gs_image_file_init(image_file, path)
    if image_file.loaded then
      obs.obs_enter_graphics()
      obs.gs_image_file_init_texture(image_file)
      obs.obs_leave_graphics()
      ui_top_texture = image_file
      print("script_update() success!")
    else
      -- Logs the error if the file cannot be read, except if it was the default value (empty)
      if string.len(path) > 4 then
        print("ERROR: Cannot load image file " .. path)
      end
      obs.gs_image_file_free(image_file)
      ui_top_texture = nil
    end
  end

  local path = obs.obs_data_get_string(settings, "ui_topright_texture_path")
  if ui_topright_texture_path ~= path then
    print("script_update() attempt reload " .. path)
    ui_topright_texture_path = path
    -- Checks if another image was previously loaded to free it
    if ui_topright_texture ~= nil then
      obs.gs_image_file_free(ui_topright_texture)
    end
    -- Reads the new picture from storage and initializes the texture in the GPU
    local image_file = obs.gs_image_file()
    obs.gs_image_file_init(image_file, path)
    if image_file.loaded then
      obs.obs_enter_graphics()
      obs.gs_image_file_init_texture(image_file)
      obs.obs_leave_graphics()
      ui_topright_texture = image_file
      print("script_update() success!")
    else
      -- Logs the error if the file cannot be read, except if it was the default value (empty)
      if string.len(path) > 4 then
        print("ERROR: Cannot load image file " .. path)
      end
      obs.gs_image_file_free(image_file)
      ui_topright_texture = nil
    end
  end

  local path = obs.obs_data_get_string(settings, "ui_right_texture_path")
  if ui_right_texture_path ~= path then
    print("script_update() attempt reload " .. path)
    ui_right_texture_path = path
    -- Checks if another image was previously loaded to free it
    if ui_right_texture ~= nil then
      obs.gs_image_file_free(ui_right_texture)
    end
    -- Reads the new picture from storage and initializes the texture in the GPU
    local image_file = obs.gs_image_file()
    obs.gs_image_file_init(image_file, path)
    if image_file.loaded then
      obs.obs_enter_graphics()
      obs.gs_image_file_init_texture(image_file)
      obs.obs_leave_graphics()
      ui_right_texture = image_file
      print("script_update() success!")
    else
      -- Logs the error if the file cannot be read, except if it was the default value (empty)
      if string.len(path) > 4 then
        print("ERROR: Cannot load image file " .. path)
      end
      obs.gs_image_file_free(image_file)
      ui_right_texture = nil
    end
  end

  local path = obs.obs_data_get_string(settings, "ui_bottomright_texture_path")
  if ui_bottomright_texture_path ~= path then
    print("script_update() attempt reload " .. path)
    ui_bottomright_texture_path = path
    -- Checks if another image was previously loaded to free it
    if ui_bottomright_texture ~= nil then
      obs.gs_image_file_free(ui_bottomright_texture)
    end
    -- Reads the new picture from storage and initializes the texture in the GPU
    local image_file = obs.gs_image_file()
    obs.gs_image_file_init(image_file, path)
    if image_file.loaded then
      obs.obs_enter_graphics()
      obs.gs_image_file_init_texture(image_file)
      obs.obs_leave_graphics()
      ui_bottomright_texture = image_file
      print("script_update() success!")
    else
      -- Logs the error if the file cannot be read, except if it was the default value (empty)
      if string.len(path) > 4 then
        print("ERROR: Cannot load image file " .. path)
      end
      obs.gs_image_file_free(image_file)
      ui_bottomright_texture = nil
    end
  end

  local path = obs.obs_data_get_string(settings, "ui_bottom_texture_path")
  if ui_bottom_texture_path ~= path then
    print("script_update() attempt reload " .. path)
    ui_bottom_texture_path = path
    -- Checks if another image was previously loaded to free it
    if ui_bottom_texture ~= nil then
      obs.gs_image_file_free(ui_bottom_texture)
    end
    -- Reads the new picture from storage and initializes the texture in the GPU
    local image_file = obs.gs_image_file()
    obs.gs_image_file_init(image_file, path)
    if image_file.loaded then
      obs.obs_enter_graphics()
      obs.gs_image_file_init_texture(image_file)
      obs.obs_leave_graphics()
      ui_bottom_texture = image_file
      print("script_update() success!")
    else
      -- Logs the error if the file cannot be read, except if it was the default value (empty)
      if string.len(path) > 4 then
        print("ERROR: Cannot load image file " .. path)
      end
      obs.gs_image_file_free(image_file)
      ui_bottom_texture = nil
    end
  end

  local path = obs.obs_data_get_string(settings, "ui_bottomleft_texture_path")
  if ui_bottomleft_texture_path ~= path then
    print("script_update() attempt reload " .. path)
    ui_bottomleft_texture_path = path
    -- Checks if another image was previously loaded to free it
    if ui_bottomleft_texture ~= nil then
      obs.gs_image_file_free(ui_bottomleft_texture)
    end
    -- Reads the new picture from storage and initializes the texture in the GPU
    local image_file = obs.gs_image_file()
    obs.gs_image_file_init(image_file, path)
    if image_file.loaded then
      obs.obs_enter_graphics()
      obs.gs_image_file_init_texture(image_file)
      obs.obs_leave_graphics()
      ui_bottomleft_texture = image_file
      print("script_update() success!")
    else
      -- Logs the error if the file cannot be read, except if it was the default value (empty)
      if string.len(path) > 4 then
        print("ERROR: Cannot load image file " .. path)
      end
      obs.gs_image_file_free(image_file)
      ui_bottomleft_texture = nil
    end
  end

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

  -- Compiles the effect from a .effect file in the same folder as the Lua script
  -- See https://obsproject.com/docs/graphics.html
  -- TODO: Change the name of the effect file according to your effect, store it in the same folder
  obs.obs_enter_graphics()
  data.effect_compilation_failed = false
  local effect_file_path = script_path() .. 'window.effect'
  data.effect = obs.gs_effect_create_from_file(effect_file_path, nil)

  -- TODO: Optional: To distribute a single Lua file once the shader is working, copy the
  --       content of the .effect file into a global string variable called EFFECT, then
  --       compiled using the following line (to be uncommented):
  -- data.effect = obs.gs_effect_create(EFFECT, 'lua_embedded_effect', nil)

  -- Replaces the effect with an annoying solid PINK color if the compilation failed
  -- This part should not be modified, it shows an example of an effect file embedded in Lua
  if data.effect == nil then
    data.effect_compilation_failed = true
    print("Effect compilation failed")     -- Logs the error in scripts log and OBS log
    local FALLBACK_EFFECT=[[uniform float4x4 ViewProj; uniform texture2d image;
      struct ShaderData { float4 pos : POSITION; float2 uv  : TEXCOORD0; };
      ShaderData vertex_shader(ShaderData vtx)
      { vtx.pos = mul(float4(vtx.pos.xyz, 1.0), ViewProj); return vtx; }
      float4 pixel_shader(ShaderData pix) : TARGET
      { return float4(1.0,0.0, 0.5, 1.0); }
      technique Draw {
        pass {
          vertex_shader = vertex_shader(vtx);
          pixel_shader  = pixel_shader(pix);
        }
      } ]]
    data.effect = obs.gs_effect_create(FALLBACK_EFFECT, 'fallback_effect', nil)

    -- Deactivates filter if the fallback cannot be compiled as well (should not happen)
    if data.effect == nil then
      print("Fallback effect compilation failed")
      source_info.destroy(data)
      return nil
    end
  end

  obs.obs_leave_graphics()
  
  -- Retrieves the shader uniform variables
  if not data.effect_compilation_failed then

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

  end

  -- Calls update to initialize the rest of the properties-managed settings
  source_info.update(data, settings)

  return data
end

-- Destroys and release resources linked to the custom data
source_info.destroy = function(data)
  if data.effect ~= nil then
    obs.obs_enter_graphics()
    obs.gs_effect_destroy(data.effect)
    data.effect = nil
    obs.obs_leave_graphics()
  end
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
  data.width = obs.obs_source_get_base_width(parent)
  data.height = obs.obs_source_get_base_height(parent)

   -- Begins the rendering
  local technique = "Draw"
  obs.obs_source_process_filter_begin(data.source, obs.GS_RGBA, obs.OBS_ALLOW_DIRECT_RENDERING)

  -- Sets shader data for the draw if the shader compilation was successful
  if not data.effect_compilation_failed then

    data.ui_length = obs.gs_texture_get_width(ui_left_texture.texture)
    data.text_length = obs.gs_texture_get_width(ui_top_texture.texture)

    data.width_ratio = data.ui_length / data.width * data.scale
    data.height_ratio = data.ui_length / data.height * data.scale
    data.text_ratio = data.text_length / data.ui_length
    
    obs.gs_effect_set_texture(data.params.ui_left, ui_left_texture.texture)
    obs.gs_effect_set_texture(data.params.ui_topleft, ui_topleft_texture.texture)
    obs.gs_effect_set_texture(data.params.ui_top, ui_top_texture.texture)
    obs.gs_effect_set_texture(data.params.ui_topright, ui_topright_texture.texture)
    obs.gs_effect_set_texture(data.params.ui_right, ui_right_texture.texture)
    obs.gs_effect_set_texture(data.params.ui_bottomright, ui_bottomright_texture.texture)
    obs.gs_effect_set_texture(data.params.ui_bottom, ui_bottom_texture.texture)
    obs.gs_effect_set_texture(data.params.ui_bottomleft, ui_bottomleft_texture.texture)

    obs.gs_effect_set_float(data.params.width_ratio, data.width_ratio)
    obs.gs_effect_set_float(data.params.height_ratio, data.height_ratio)
    obs.gs_effect_set_float(data.params.text_ratio, data.text_ratio)

  end

  -- Completes the filter processing i.e. starts the draw through the effect shaders
  obs.obs_source_process_filter_tech_end(data.source, data.effect,
                                         data.width, data.height, technique)
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

-- Returns new texture and free current texture if loaded
function load_texture(path, current_texture)

  obs.obs_enter_graphics()

  -- Free any existing image
  if current_texture then
    obs.gs_image_file_free(current_texture)
  end

  -- Loads and inits image for texture
  local new_texture = nil
  if string.len(path) > 0 then
    new_texture = obs.gs_image_file()
    obs.gs_image_file_init(new_texture, path)
    if new_texture.loaded then
      obs.gs_image_file_init_texture(new_texture)
    else
      obs.blog(obs.LOG_ERROR, "Cannot load image " .. path)
      obs.gs_image_file_free(current_texture)
      new_texture = nil
    end
  end

  obs.obs_leave_graphics()
  obs.blog(obs.LOG_INFO, "Loaded image " .. path .. "successfully!")

  return new_texture
end


-- Updates the internal data for this source upon settings change
source_info.update = function(data, settings)
  data.scale = obs.obs_data_get_double(settings, "ui_scale")
end
