vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ros-industrial/ros_industrial_cmake_boilerplate
    REF 0.2.12
    SHA512 fcc9cf660a0304fac798976d3107ff791570e5d2ca3f1f67c29afbcdb7318bc2588df51b9a2003d8a91e8898423b45b655edf3571861bb6b342765bc213eaa6f
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}/ros_industrial_cmake_boilerplate
    PREFER_NINJA
)

vcpkg_install_cmake()

vcpkg_cmake_config_fixup(PACKAGE_NAME "ros_industrial_cmake_boilerplate"
                         CONFIG_PATH "lib/cmake/ros_industrial_cmake_boilerplate")
vcpkg_fixup_pkgconfig()

# remove unneeded directories, since this is a pure cmake package
set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/lib)

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/ros-industrial-cmake-boilerplate RENAME copyright)