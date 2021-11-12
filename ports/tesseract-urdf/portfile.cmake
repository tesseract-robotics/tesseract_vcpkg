vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ros-industrial-consortium/tesseract
    REF 0.6.4
    SHA512 0f78739a35893c2cea78714c7952ad28d659a0d1912a633937693896fb7c5e9463b020b9f3967bd9fbb0773e8cd530d97095ee1cec33b1ae60023a7d2d0f3c5a
    HEAD_REF master
    PATCHES
        "rm-examples.patch"
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}/tesseract_urdf
    PREFER_NINJA
    OPTIONS
        # this is a hack, but otherwise fails find_package
        -Dros_industrial_cmake_boilerplate_DIR=${CURRENT_INSTALLED_DIR}/share/ros_industrial_cmake_boilerplate
)
vcpkg_install_cmake()

vcpkg_cmake_config_fixup(PACKAGE_NAME "tesseract_urdf"
                         CONFIG_PATH "lib/cmake/tesseract_urdf")
vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
#file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
#file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/tesseract-urdf RENAME copyright)