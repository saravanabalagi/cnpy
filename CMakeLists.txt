CMAKE_MINIMUM_REQUIRED(VERSION 3.0 FATAL_ERROR)
if(COMMAND cmake_policy)
	cmake_policy(SET CMP0003 NEW)
    cmake_policy(SET CMP0074 NEW)
endif(COMMAND cmake_policy)

project(CNPY)

option(ENABLE_STATIC "Build static (.a) library" ON)

set(ZLIB_ROOT "libs/zlib/dist")
find_package(ZLIB REQUIRED)
include_directories(${ZLIB_INCLUDE_DIRS})

add_library(cnpy SHARED "cnpy.cpp")
target_link_libraries(cnpy ${ZLIB_LIBRARIES})
set_property(TARGET cnpy PROPERTY CXX_STANDARD 17)

install(TARGETS cnpy LIBRARY DESTINATION lib PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)

if(ENABLE_STATIC)
    add_library(cnpy-static STATIC "cnpy.cpp")
    set_target_properties(cnpy-static PROPERTIES OUTPUT_NAME "cnpy")
    install(TARGETS "cnpy-static" ARCHIVE DESTINATION lib)
endif(ENABLE_STATIC)

install(FILES "cnpy.h" DESTINATION include)

