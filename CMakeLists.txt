cmake_minimum_required (VERSION 3.15)

if (POLICY CMP0141)
  cmake_policy(SET CMP0141 NEW)
  set(CMAKE_MSVC_DEBUG_INFORMATION_FORMAT "$<IF:$<AND:$<C_COMPILER_ID:MSVC>,$<CXX_COMPILER_ID:MSVC>>,$<$<CONFIG:Debug,RelWithDebInfo>:EditAndContinue>,$<$<CONFIG:Debug,RelWithDebInfo>:ProgramDatabase>>")
endif()

project ("CMake_Exo")

set(CPM_DOWNLOAD_VERSION 0.42.0)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
include(cpm)

CPMADDPACKAGE(
	NAME Catch2
	GITHUB_REPOSITORY CatchOrg/Catch2
	VERSION 3.6.0
	OPTIONS "CATCH_BUILD_TESTING_OFF"
)

CPMADDPACKAGE(
	NAME SFML
	GITHUB_REPOSITORY SFML/SFML
	GIT_TAG 3.0.2 
)

set(CMAKE_CXX_STANDARD 20)

add_subdirectory ("CMake_Lib")
add_subdirectory ("CMake_Test")
add_subdirectory ("CATCH2MYBELOVED")
