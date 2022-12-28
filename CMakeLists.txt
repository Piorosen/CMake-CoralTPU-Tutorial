cmake_minimum_required(VERSION 3.4.1)
SET(PROJ_NAME chacha)
project(${PROJ_NAME})

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")

OPTION(MAX_CORAL_MODE "Uses 100% Coral TPU board performance. If you use it, you'll get more fever." OFF)
OPTION(TEST_BUILD_LSTPU "The command lstpu outputs a list of TPU equipment currently connected." OFF)

if (MAX_CORAL_MODE)
message("USE_MAX_CORAL_MODE")
link_directories(${CMAKE_SOURCE_DIR}/3rdparty/prebuilt/direct)

else()
message("USE_THROTTLE_CORAL_MODE")
link_directories(${CMAKE_SOURCE_DIR}/3rdparty/prebuilt/throttled)

endif()

link_directories(${CMAKE_SOURCE_DIR}/3rdparty/prebuilt)

# library headers
message(${CMAKE_SOURCE_DIR})
include_directories(${CMAKE_SOURCE_DIR}/3rdparty/libedgetpu)
include_directories(${CMAKE_SOURCE_DIR}/3rdparty/tensorflow)
include_directories(${CMAKE_SOURCE_DIR}/3rdparty/abseil-cpp)
include_directories(${CMAKE_SOURCE_DIR}/3rdparty/flatbuffers/include)

set(CMAKE_INSTALL_RPATH "bin")

if (TEST_BUILD_LSTPU)
add_executable(${PROJ_NAME}
	lstpu.cpp
)
else()
add_executable(${PROJ_NAME}
        main.cpp
)
endif()

target_link_libraries(${PROJ_NAME} 
	flatbuffers 
	tensorflowlite 
	tensorflowlite_c 
	edgetpu)

# install target and libraries
set(CMAKE_INSTALL_PREFIX ${CMAKE_SOURCE_DIR}/bin)

