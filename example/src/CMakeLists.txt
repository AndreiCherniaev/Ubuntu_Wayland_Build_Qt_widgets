cmake_minimum_required(VERSION 3.16)
project(myexample LANGUAGES CXX DESCRIPTION "This text will be inside PROJECT_DESCRIPTION variable" VERSION 0.1.2.3)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Widgets)

qt_standard_project_setup()

qt_add_executable(${PROJECT_NAME}
    client.cpp client.h
    main.cpp
)

target_link_libraries(${PROJECT_NAME} PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Widgets
)

install(TARGETS ${PROJECT_NAME}
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

qt_generate_deploy_app_script(
    TARGET ${PROJECT_NAME}
    OUTPUT_SCRIPT deploy_script
    NO_UNSUPPORTED_PLATFORM_ERROR
)
install(SCRIPT ${deploy_script})
install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/icon64.png" DESTINATION "${CMAKE_INSTALL_DATAROOTDIR}/pixmaps")

set(CPACK_PACKAGE_NAME "${PROJECT_NAME}")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "${PROJECT_DESCRIPTION}")
set(CPACK_PACKAGE_VENDOR "My Company")
set(CPACK_PACKAGE_INSTALL_DIRECTORY ${CPACK_PACKAGE_NAME})
set(CPACK_VERBATIM_VARIABLES ON)
set(CPACK_PACKAGING_INSTALL_PREFIX "/opt/myapp")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Package Maintainer <maintainer@example.com>")
set(CPACK_DEBIAN_PACKAGE_DEPENDS libc6 libstdc++6 libgcc-s1)
include(CPack)
