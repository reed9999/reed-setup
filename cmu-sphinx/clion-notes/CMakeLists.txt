cmake_minimum_required(VERSION 3.9)
project(cmu_sphinx)

set(CMAKE_CXX_STANDARD 11)
set(MODELDIR 'usr/local/share/pocketsphinx/model')

add_executable(hello_clion
        hello_ps.c)
