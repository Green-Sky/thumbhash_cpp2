cmake_minimum_required(VERSION 3.23...3.30 FATAL_ERROR)

project(thumbhash_cpp2)

########################################

include(FetchContent)

FetchContent_Declare(
	cppfront
	GIT_REPOSITORY https://github.com/Green-Sky/cmake-cppfront.git
	GIT_TAG 581f1aa4cdd7dabac1fc088d553ba95e1238821f # before cmake 3.30
)

FetchContent_MakeAvailable(cppfront)

########################################

add_library(thumbhash INTERFACE
	thumbhash.h2
	#thumbhash.cpp2
)

########################################

# TODO: testing
add_executable(thumbhash_tests
	./tests.cpp2
)

target_link_libraries(thumbhash_tests PRIVATE
	thumbhash
)

########################################

#add_executable(thumbhash_cpp1_test
	#./cpp1_test.cpp
#)

#target_link_libraries(thumbhash_cpp1_test PRIVATE
	#thumbhash
#)

