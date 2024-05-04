cmake_minimum_required(VERSION 3.26)

project(llvm-kaleidescope VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)

add_executable(kaleidescope-repl)
target_sources(kaleidescope-repl 
    PUBLIC
    src/main.cpp
    src/lexer.cpp
)

install(TARGETS kaleidescope-repl DESTINATION bin)