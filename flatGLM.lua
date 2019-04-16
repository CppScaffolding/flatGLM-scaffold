-- scaffold geniefile for flatGLM

flatGLM_script = path.getabsolute(path.getdirectory(_SCRIPT))
flatGLM_root = path.join(flatGLM_script, "flatGLM")

flatGLM_includedirs = {
	path.join(flatGLM_script, "config"),
	flatGLM_root,
}

flatGLM_libdirs = {}
flatGLM_links = {}
flatGLM_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { flatGLM_includedirs }
	end,

	_add_defines = function()
		defines { flatGLM_defines }
	end,

	_add_libdirs = function()
		libdirs { flatGLM_libdirs }
	end,

	_add_external_links = function()
		links { flatGLM_links }
	end,

	_add_self_links = function()
		links { "flatGLM" }
	end,

	_create_projects = function()

project "flatGLM"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		flatGLM_includedirs,
	}

	defines {}

	files {
		path.join(flatGLM_script, "config", "**.h"),
		path.join(flatGLM_root, "**.h"),
		path.join(flatGLM_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
