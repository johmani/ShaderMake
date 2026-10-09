project "ShaderMakeBlob"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	warnings "Extra"
	fatalwarnings { "All" }
    objdir (IntermediatesOutputDir)

	files
	{
		"include/ShaderMake/ShaderBlob.h",
		"src/ShaderBlob.cpp",
		"*.lua"
	}

	includedirs
	{
		"include"
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS"
	}

	filter "system:windows"
		systemversion "latest"

	filter "system:linux"
		pic "On"
		systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        symbols "On"

    filter "configurations:Dist"
        runtime "Release"
        symbols "Off"

project "ShaderMake"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++20"
	warnings "Extra"
	fatalwarnings { "All" }
    objdir (IntermediatesOutputDir)
	targetdir (binOutputDir)

	files
	{
		"include/ShaderMake/ShaderBlob.h",
		"src/argparse.h",
		"src/argparse.c",
		"src/ShaderMake.cpp",
		"*.lua"
	}

	includedirs
	{
		"include"
	}

	links
	{
		"ShaderMakeBlob"
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS"
	}

	filter "system:windows"
		systemversion "latest"
		links
		{
			"D3DCompiler.lib",
			"dxcompiler.lib"
		}

	filter "system:linux"
		pic "On"
		systemversion "latest"
		
    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        symbols "On"

    filter "configurations:Dist"
        runtime "Release"
        symbols "Off"
