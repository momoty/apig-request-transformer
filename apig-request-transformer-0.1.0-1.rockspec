package = "apig-request-transformer"  -- TODO: rename, must match the info in the filename of this rockspec!
                                  -- as a convention; stick to the prefix: `kong-plugin-`
version = "0.1.0-1"               -- TODO: renumber, must match the info in the filename of this rockspec!
-- The version '0.1.0' is the source code version, the trailing '1' is the version of this rockspec.
-- whenever the source version changes, the rockspec should be reset to 1. The rockspec version is only
-- updated (incremented) when this file changes, but the source remains the same.

-- TODO: This is the name to set in the Kong configuration `plugins` setting.
-- Here we extract it from the package name.
local pluginName = package:match("^(.+)$")

supported_platforms = {"linux", "macosx"}
source = {
  url = "https://github.com/cheriL/inspur-request-transformer",
  tag = "0.1.0"
}

description = {
  summary = "Kong plugin to transform the request.",
  homepage = "https://github.com/cheriL/inspur-request-transformer",
  license = "Apache 2.0"
}

dependencies = {
}

build = {
  type = "builtin",
  modules = {
    -- TODO: add any additional files that the plugin consists of
    ["kong.plugins."..pluginName..".handler"] = "kong/plugins/"..pluginName.."/handler.lua",
	["kong.plugins."..pluginName..".access"] = "kong/plugins/"..pluginName.."/access.lua",
	["kong.plugins."..pluginName..".path_params"] = "kong/plugins/"..pluginName.."/path_params.lua",
    ["kong.plugins."..pluginName..".schema"] = "kong/plugins/"..pluginName.."/schema.lua",
  }
}
