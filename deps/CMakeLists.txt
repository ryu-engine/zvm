
set(cur_dir ${CMAKE_CURRENT_SOURCE_DIR})
set(deps)


add_library(zvm_deps INTERFACE)
add_library(zvm::deps ALIAS zvm_deps)

target_link_libraries(zvm_deps INTERFACE ${deps})

unset(cur_dir)