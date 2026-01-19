cmake_minimum_required(VERSION 3.10)
project(WeatherNetworkServer)

set(CMAKE_CXX_STANDARD 17)

add_executable(weather_server 
    main.cpp 
    sqlite3.c
)

configure_file(index.html index.html COPYONLY)

if(WIN32)
    target_link_libraries(weather_server ws2_32)
else()
    target_link_libraries(weather_server pthread dl)
endif()

add_executable(sensor_simulator simulator.cpp)