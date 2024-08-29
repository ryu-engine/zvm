cmake_minimum_required(VERSION 3.25)

set(zvm_root ${CMAKE_CURRENT_SOURCE_DIR})

project(zvm
	VERSION 0.1.0
	DESCRIPTION "zvm - the zen virtual machine"
	LANGUAGES CXX
)

include(${zvm_root}/cmake/prelude.cmake)

file(GLOB_RECURSE zvm_headers CONFIGURE_DEPENDS ${zvm_root}/code/include/*.h)
file(GLOB_RECURSE zvm_sources CONFIGURE_DEPENDS ${zvm_root}/code/sources/*.cpp)
add_library(${PROJECT_NAME} ${zvm_headers} ${zvm_sources})

add_subdirectory(${zvm_root}/deps)

target_link_libraries(${PROJECT_NAME} PUBLIC zvm::deps)

target_include_directories(${PROJECT_NAME} PUBLIC
	${zvm_root}/code/include
	${PROJECT_BINARY_DIR}/include
)
set_target_properties(${PROJECT_NAME} PROPERTIES
	CXX_VISIBILITY_PRESET hidden
	CXX_EXTENSIONS OFF
	C_EXTENSIONS OFF
	VISIBILITY_INLINES_HIDDEN 1
)

set(zvm_export_header include/${PROJECT_NAME}/export.h)
generate_export_header(${PROJECT_NAME}
	EXPORT_FILE_NAME ${zvm_export_header}
)

install(TARGETS ${PROJECT_NAME} DESTINATION ${zvm_out}/$<IF:$<CONFIG:Debug>,debug,release>/lib/)
install(
	FILES
		${zvm_headers}
		${PROJECT_BINARY_DIR}/${zvm_export_header}
	DESTINATION
		${zvm_out}/$<IF:$<CONFIG:Debug>,debug,release>/include
)
