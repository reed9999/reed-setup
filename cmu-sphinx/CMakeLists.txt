cmake_minimum_required(VERSION 3.9)
project(cmu_sphinx)

set(CMAKE_CXX_STANDARD 11)
#set(MODELDIR 'usr/local/share/pocketsphinx/model')

add_executable(hello_clion
        hello_ps.c)
target_compile_definitions(hello_clion PRIVATE MODELDIR='usr/local/share/pocketsphinx/model')
#https://cmake.org/cmake/help/v3.0/command/target_include_directories.html
target_include_directories(hello_clion PRIVATE

    /usr/local/include
    /usr/local/include/sphinxbase
    /usr/local/include/pocketsphinx
    /usr/local/include
    /usr/local/include/sphinxbase
        )

#https://stackoverflow.com/questions/14077611/how-do-i-tell-cmake-to-link-in-a-static-library-in-the-source-directory
#target_link_libraries(main ${CMAKE_SOURCE_DIR}/libbingitup.a)
target_link_libraries(hello_clion pocketsphinx
sphinxbase
sphinxad
asound
pthread
m
        )