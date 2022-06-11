cmake_minimum_required(VERSION 3.0 FATAL_ERROR)
project(cnpy_example)

if(COMMAND cmake_policy)
    cmake_policy(SET CMP0074 NEW)
endif(COMMAND cmake_policy)

set(ZLIB_ROOT "../../libs/zlib/dist")
find_package(ZLIB REQUIRED)

set(CNPY_ROOT "../../dist")
find_package(CNPY REQUIRED)

include_directories(
    ${CNPY_INCLUDE_DIRS}
    ${ZLIB_INCLUDE_DIRS}
)

add_executable(example example.cpp)
target_link_libraries(example CNPY ${ZLIB_LIBRARIES})
set_property(TARGET example PROPERTY CXX_STANDARD 17)
