
#======================================== TOP LEVEL CHECK =========================================#

if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
	set(zvm_is_top_level TRUE)
else()
	set(zvm_is_top_level FALSE)
endif()

#======================================= SETUP DIRECTORIES ========================================#

macro(make_directory_if_not_exists dir)
	if (NOT IS_DIRECTORY ${dir})
		file(MAKE_DIRECTORY ${dir})
	endif()
endmacro()

string(TOLOWER ${CMAKE_CXX_COMPILER_ID} zvm_compiler_id)
set(zvm_out ${zvm_root}/out/${zvm_compiler_id})
make_directory_if_not_exists(${zvm_out})

#============================================ INCLUDES ============================================#

include(${zvm_root}/cmake/tools.cmake)
include(GenerateExportHeader)

#=========================================== UTILITIES ============================================#

find_program(CCACHE_FOUND ccache)
if (CCACHE_FOUND)
	message(STATUS "Ccache found")
	set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
endif()

#======================================= PLATFORM DETECTION =======================================#

string(TOLOWER ${CMAKE_HOST_SYSTEM_NAME} zvm_platform)

message(STATUS "Detected OS: ${zvm_platform}")

#========================================== CXX STANDARD ==========================================#

set_standards(
	CPP_STD 20
	C_STD   17
)

#========================================== DEFINITIONS ===========================================#

string(TOUPPER ${zvm_platform} _platform)
add_compile_definitions(
	ZVM_${_platform}                        # ZVM_WINDOWS, ZVM_LINUX, etc.
	ZVM_$<IF:$<CONFIG:Debug>,DEBUG,RELEASE> # ZVM_DEBUG, ZVM_RELEASE
	$<$<CXX_COMPILER_ID:MSVC>:_CRT_SECURE_NO_WARNINGS>
)
unset(_platform)

#========================================= COMPILER FLAGS =========================================#

