find_package(Doxygen)

if (DOXYGEN_FOUND)
{
	# Dis a Doxygen quel fichier lire et ou écrire la doc
	set(DOXYFILE_IN ${CMAKE_CURRENT_SOURCE_DIR}/docs/Doxyfile.in))
	set(DOXYFILE_OUT ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)
	configure_file(${DOXYFILE_IN} ${DOXYFILE_OUT} @ONLY)

	# Créer une target custom 'cmake --target docs' pour générer la doc
	add_custom_target( docs
		COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYFILE_OUT}
		WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
		COMMENT "Generating doc with Doxygen"
		VERBATIM )
}
else ()
	message(WARNING "Doxygen not found") 
endif()