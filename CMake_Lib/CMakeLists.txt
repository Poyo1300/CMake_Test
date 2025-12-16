add_library(CMake_Lib)



set(INCLUDE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/include)
set(SOURCE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/source)

target_sources(CMake_Lib 
PRIVATE ${SOURCE_PATH}/CMake_Lib.cpp
)
target_include_directories(CMake_Lib 
PUBLIC ${INCLUDE_PATH}
)
