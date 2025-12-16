# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(sfml_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(sfml_FRAMEWORKS_FOUND_RELEASE "${sfml_FRAMEWORKS_RELEASE}" "${sfml_FRAMEWORK_DIRS_RELEASE}")

set(sfml_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET sfml_DEPS_TARGET)
    add_library(sfml_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET sfml_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${sfml_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${sfml_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:SFML::System;opengl::opengl;SFML::Window;miniaudio::miniaudio>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### sfml_DEPS_TARGET to all of them
conan_package_library_targets("${sfml_LIBS_RELEASE}"    # libraries
                              "${sfml_LIB_DIRS_RELEASE}" # package_libdir
                              "${sfml_BIN_DIRS_RELEASE}" # package_bindir
                              "${sfml_LIBRARY_TYPE_RELEASE}"
                              "${sfml_IS_HOST_WINDOWS_RELEASE}"
                              sfml_DEPS_TARGET
                              sfml_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "sfml"    # package_name
                              "${sfml_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${sfml_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## COMPONENTS TARGET PROPERTIES Release ########################################

    ########## COMPONENT SFML::Graphics #############

        set(sfml_SFML_Graphics_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(sfml_SFML_Graphics_FRAMEWORKS_FOUND_RELEASE "${sfml_SFML_Graphics_FRAMEWORKS_RELEASE}" "${sfml_SFML_Graphics_FRAMEWORK_DIRS_RELEASE}")

        set(sfml_SFML_Graphics_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET sfml_SFML_Graphics_DEPS_TARGET)
            add_library(sfml_SFML_Graphics_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET sfml_SFML_Graphics_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${sfml_SFML_Graphics_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${sfml_SFML_Graphics_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${sfml_SFML_Graphics_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'sfml_SFML_Graphics_DEPS_TARGET' to all of them
        conan_package_library_targets("${sfml_SFML_Graphics_LIBS_RELEASE}"
                              "${sfml_SFML_Graphics_LIB_DIRS_RELEASE}"
                              "${sfml_SFML_Graphics_BIN_DIRS_RELEASE}" # package_bindir
                              "${sfml_SFML_Graphics_LIBRARY_TYPE_RELEASE}"
                              "${sfml_SFML_Graphics_IS_HOST_WINDOWS_RELEASE}"
                              sfml_SFML_Graphics_DEPS_TARGET
                              sfml_SFML_Graphics_LIBRARIES_TARGETS
                              "_RELEASE"
                              "sfml_SFML_Graphics"
                              "${sfml_SFML_Graphics_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET SFML::Graphics
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${sfml_SFML_Graphics_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${sfml_SFML_Graphics_LIBRARIES_TARGETS}>
                     )

        if("${sfml_SFML_Graphics_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET SFML::Graphics
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         sfml_SFML_Graphics_DEPS_TARGET)
        endif()

        set_property(TARGET SFML::Graphics APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${sfml_SFML_Graphics_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET SFML::Graphics APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${sfml_SFML_Graphics_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET SFML::Graphics APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${sfml_SFML_Graphics_LIB_DIRS_RELEASE}>)
        set_property(TARGET SFML::Graphics APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${sfml_SFML_Graphics_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET SFML::Graphics APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${sfml_SFML_Graphics_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT SFML::Audio #############

        set(sfml_SFML_Audio_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(sfml_SFML_Audio_FRAMEWORKS_FOUND_RELEASE "${sfml_SFML_Audio_FRAMEWORKS_RELEASE}" "${sfml_SFML_Audio_FRAMEWORK_DIRS_RELEASE}")

        set(sfml_SFML_Audio_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET sfml_SFML_Audio_DEPS_TARGET)
            add_library(sfml_SFML_Audio_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET sfml_SFML_Audio_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${sfml_SFML_Audio_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${sfml_SFML_Audio_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${sfml_SFML_Audio_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'sfml_SFML_Audio_DEPS_TARGET' to all of them
        conan_package_library_targets("${sfml_SFML_Audio_LIBS_RELEASE}"
                              "${sfml_SFML_Audio_LIB_DIRS_RELEASE}"
                              "${sfml_SFML_Audio_BIN_DIRS_RELEASE}" # package_bindir
                              "${sfml_SFML_Audio_LIBRARY_TYPE_RELEASE}"
                              "${sfml_SFML_Audio_IS_HOST_WINDOWS_RELEASE}"
                              sfml_SFML_Audio_DEPS_TARGET
                              sfml_SFML_Audio_LIBRARIES_TARGETS
                              "_RELEASE"
                              "sfml_SFML_Audio"
                              "${sfml_SFML_Audio_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET SFML::Audio
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${sfml_SFML_Audio_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${sfml_SFML_Audio_LIBRARIES_TARGETS}>
                     )

        if("${sfml_SFML_Audio_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET SFML::Audio
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         sfml_SFML_Audio_DEPS_TARGET)
        endif()

        set_property(TARGET SFML::Audio APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${sfml_SFML_Audio_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET SFML::Audio APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${sfml_SFML_Audio_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET SFML::Audio APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${sfml_SFML_Audio_LIB_DIRS_RELEASE}>)
        set_property(TARGET SFML::Audio APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${sfml_SFML_Audio_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET SFML::Audio APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${sfml_SFML_Audio_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT SFML::Network #############

        set(sfml_SFML_Network_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(sfml_SFML_Network_FRAMEWORKS_FOUND_RELEASE "${sfml_SFML_Network_FRAMEWORKS_RELEASE}" "${sfml_SFML_Network_FRAMEWORK_DIRS_RELEASE}")

        set(sfml_SFML_Network_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET sfml_SFML_Network_DEPS_TARGET)
            add_library(sfml_SFML_Network_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET sfml_SFML_Network_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${sfml_SFML_Network_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${sfml_SFML_Network_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${sfml_SFML_Network_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'sfml_SFML_Network_DEPS_TARGET' to all of them
        conan_package_library_targets("${sfml_SFML_Network_LIBS_RELEASE}"
                              "${sfml_SFML_Network_LIB_DIRS_RELEASE}"
                              "${sfml_SFML_Network_BIN_DIRS_RELEASE}" # package_bindir
                              "${sfml_SFML_Network_LIBRARY_TYPE_RELEASE}"
                              "${sfml_SFML_Network_IS_HOST_WINDOWS_RELEASE}"
                              sfml_SFML_Network_DEPS_TARGET
                              sfml_SFML_Network_LIBRARIES_TARGETS
                              "_RELEASE"
                              "sfml_SFML_Network"
                              "${sfml_SFML_Network_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET SFML::Network
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${sfml_SFML_Network_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${sfml_SFML_Network_LIBRARIES_TARGETS}>
                     )

        if("${sfml_SFML_Network_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET SFML::Network
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         sfml_SFML_Network_DEPS_TARGET)
        endif()

        set_property(TARGET SFML::Network APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${sfml_SFML_Network_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET SFML::Network APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${sfml_SFML_Network_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET SFML::Network APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${sfml_SFML_Network_LIB_DIRS_RELEASE}>)
        set_property(TARGET SFML::Network APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${sfml_SFML_Network_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET SFML::Network APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${sfml_SFML_Network_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT SFML::Window #############

        set(sfml_SFML_Window_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(sfml_SFML_Window_FRAMEWORKS_FOUND_RELEASE "${sfml_SFML_Window_FRAMEWORKS_RELEASE}" "${sfml_SFML_Window_FRAMEWORK_DIRS_RELEASE}")

        set(sfml_SFML_Window_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET sfml_SFML_Window_DEPS_TARGET)
            add_library(sfml_SFML_Window_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET sfml_SFML_Window_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${sfml_SFML_Window_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${sfml_SFML_Window_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${sfml_SFML_Window_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'sfml_SFML_Window_DEPS_TARGET' to all of them
        conan_package_library_targets("${sfml_SFML_Window_LIBS_RELEASE}"
                              "${sfml_SFML_Window_LIB_DIRS_RELEASE}"
                              "${sfml_SFML_Window_BIN_DIRS_RELEASE}" # package_bindir
                              "${sfml_SFML_Window_LIBRARY_TYPE_RELEASE}"
                              "${sfml_SFML_Window_IS_HOST_WINDOWS_RELEASE}"
                              sfml_SFML_Window_DEPS_TARGET
                              sfml_SFML_Window_LIBRARIES_TARGETS
                              "_RELEASE"
                              "sfml_SFML_Window"
                              "${sfml_SFML_Window_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET SFML::Window
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${sfml_SFML_Window_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${sfml_SFML_Window_LIBRARIES_TARGETS}>
                     )

        if("${sfml_SFML_Window_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET SFML::Window
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         sfml_SFML_Window_DEPS_TARGET)
        endif()

        set_property(TARGET SFML::Window APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${sfml_SFML_Window_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET SFML::Window APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${sfml_SFML_Window_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET SFML::Window APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${sfml_SFML_Window_LIB_DIRS_RELEASE}>)
        set_property(TARGET SFML::Window APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${sfml_SFML_Window_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET SFML::Window APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${sfml_SFML_Window_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT SFML::Main #############

        set(sfml_SFML_Main_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(sfml_SFML_Main_FRAMEWORKS_FOUND_RELEASE "${sfml_SFML_Main_FRAMEWORKS_RELEASE}" "${sfml_SFML_Main_FRAMEWORK_DIRS_RELEASE}")

        set(sfml_SFML_Main_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET sfml_SFML_Main_DEPS_TARGET)
            add_library(sfml_SFML_Main_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET sfml_SFML_Main_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${sfml_SFML_Main_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${sfml_SFML_Main_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${sfml_SFML_Main_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'sfml_SFML_Main_DEPS_TARGET' to all of them
        conan_package_library_targets("${sfml_SFML_Main_LIBS_RELEASE}"
                              "${sfml_SFML_Main_LIB_DIRS_RELEASE}"
                              "${sfml_SFML_Main_BIN_DIRS_RELEASE}" # package_bindir
                              "${sfml_SFML_Main_LIBRARY_TYPE_RELEASE}"
                              "${sfml_SFML_Main_IS_HOST_WINDOWS_RELEASE}"
                              sfml_SFML_Main_DEPS_TARGET
                              sfml_SFML_Main_LIBRARIES_TARGETS
                              "_RELEASE"
                              "sfml_SFML_Main"
                              "${sfml_SFML_Main_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET SFML::Main
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${sfml_SFML_Main_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${sfml_SFML_Main_LIBRARIES_TARGETS}>
                     )

        if("${sfml_SFML_Main_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET SFML::Main
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         sfml_SFML_Main_DEPS_TARGET)
        endif()

        set_property(TARGET SFML::Main APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${sfml_SFML_Main_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET SFML::Main APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${sfml_SFML_Main_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET SFML::Main APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${sfml_SFML_Main_LIB_DIRS_RELEASE}>)
        set_property(TARGET SFML::Main APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${sfml_SFML_Main_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET SFML::Main APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${sfml_SFML_Main_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT SFML::System #############

        set(sfml_SFML_System_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(sfml_SFML_System_FRAMEWORKS_FOUND_RELEASE "${sfml_SFML_System_FRAMEWORKS_RELEASE}" "${sfml_SFML_System_FRAMEWORK_DIRS_RELEASE}")

        set(sfml_SFML_System_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET sfml_SFML_System_DEPS_TARGET)
            add_library(sfml_SFML_System_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET sfml_SFML_System_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${sfml_SFML_System_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${sfml_SFML_System_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${sfml_SFML_System_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'sfml_SFML_System_DEPS_TARGET' to all of them
        conan_package_library_targets("${sfml_SFML_System_LIBS_RELEASE}"
                              "${sfml_SFML_System_LIB_DIRS_RELEASE}"
                              "${sfml_SFML_System_BIN_DIRS_RELEASE}" # package_bindir
                              "${sfml_SFML_System_LIBRARY_TYPE_RELEASE}"
                              "${sfml_SFML_System_IS_HOST_WINDOWS_RELEASE}"
                              sfml_SFML_System_DEPS_TARGET
                              sfml_SFML_System_LIBRARIES_TARGETS
                              "_RELEASE"
                              "sfml_SFML_System"
                              "${sfml_SFML_System_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET SFML::System
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${sfml_SFML_System_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${sfml_SFML_System_LIBRARIES_TARGETS}>
                     )

        if("${sfml_SFML_System_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET SFML::System
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         sfml_SFML_System_DEPS_TARGET)
        endif()

        set_property(TARGET SFML::System APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${sfml_SFML_System_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET SFML::System APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${sfml_SFML_System_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET SFML::System APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${sfml_SFML_System_LIB_DIRS_RELEASE}>)
        set_property(TARGET SFML::System APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${sfml_SFML_System_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET SFML::System APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${sfml_SFML_System_COMPILE_OPTIONS_RELEASE}>)


    ########## AGGREGATED GLOBAL TARGET WITH THE COMPONENTS #####################
    set_property(TARGET sfml::sfml APPEND PROPERTY INTERFACE_LINK_LIBRARIES SFML::Graphics)
    set_property(TARGET sfml::sfml APPEND PROPERTY INTERFACE_LINK_LIBRARIES SFML::Audio)
    set_property(TARGET sfml::sfml APPEND PROPERTY INTERFACE_LINK_LIBRARIES SFML::Network)
    set_property(TARGET sfml::sfml APPEND PROPERTY INTERFACE_LINK_LIBRARIES SFML::Window)
    set_property(TARGET sfml::sfml APPEND PROPERTY INTERFACE_LINK_LIBRARIES SFML::Main)
    set_property(TARGET sfml::sfml APPEND PROPERTY INTERFACE_LINK_LIBRARIES SFML::System)

########## For the modules (FindXXX)
set(sfml_LIBRARIES_RELEASE sfml::sfml)
