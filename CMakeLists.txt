cmake_minimum_required(VERSION 3.15)
project(CppModulesDemo
  VERSION 1.0.0
  LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# CMake 3.26
set(CMAKE_EXPERIMENTAL_CXX_MODULE_CMAKE_API "2182bf5c-ef0d-489a-91da-49dbc3090d2a")
set(CMAKE_EXPERIMENTAL_CXX_MODULE_DYNDEP 1)
# Default to C++ extensions being off. Clang's modules support have trouble
# with extensions right now.
set(CMAKE_CXX_EXTENSIONS OFF)

add_library(math)
target_sources(math
  PRIVATE FILE_SET CXX_MODULES FILES
    src/math.cpp
)

# Represents the ./src/main.cpp file
set(EXECUTABLE_NAME "main")
add_executable(${EXECUTABLE_NAME} src/main.cpp)

target_link_libraries(${EXECUTABLE_NAME} PRIVATE math)