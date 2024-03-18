cmake_minimum_required(VERSION 3.23...3.24 FATAL_ERROR)

project(thumbhash_cpp2)

########################################

include(FetchContent)

FetchContent_Declare(
	cppfront
	GIT_REPOSITORY https://github.com/Green-Sky/cmake-cppfront.git
	GIT_TAG main
)

FetchContent_MakeAvailable(cppfront)

########################################

add_library(thumbhash
	#thumbhash.h2
	thumbhash.cpp2
)

########################################

# TODO: testing
add_executable(thumbhash_tests
	./tests.cpp2
)

target_link_libraries(thumbhash_tests PRIVATE
	thumbhash
)

