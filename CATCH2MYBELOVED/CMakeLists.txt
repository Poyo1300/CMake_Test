enable_testing()

add_executable(UnitTest test.cpp)

target_link_libraries(UnitTest PRIVATE Catch2::Catch2WithMain)
 
list(APPEND CMAKE_MODULE_PATH "${Catch2_SOURCE_DIR}/extras")

include(Catch)
catch_discover_tests(UnitTest)