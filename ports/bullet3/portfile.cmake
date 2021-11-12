vcpkg_fail_port_install(ON_ARCH "arm" "arm64" ON_TARGET "UWP")

vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bulletphysics/bullet3
    REF 3.17
    SHA512 a5105bf5f1dd365a64a350755c7d2c97942f74897a18dcdb3651e6732fd55cc1030a096f5808cf50575281f05e3ac09aa50a48d271a47b94cd61f5167a72b7cc
    HEAD_REF master
    PATCHES cmake-fix.patch cmake-fix-hacd.patch
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        multithreading       BULLET2_MULTITHREADING
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DUSE_MSVC_RUNTIME_LIBRARY_DLL=ON
        -DBUILD_CPU_DEMOS=OFF
        -DBUILD_BULLET2_DEMOS=OFF
        -DBUILD_BULLET3=OFF
        -DBUILD_EXTRAS=ON
        -DBUILD_UNIT_TESTS=OFF
        -DINSTALL_LIBS=ON
        ${FEATURE_OPTIONS}
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH share/bullet TARGET_PATH share/bullet)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/bullet/BulletInverseDynamics/details")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/bullet/HelloWorld")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/bullet/pybullet")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/bullet/SharedMemory/grpc/proto")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/bullet/SharedMemory/tcp")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/bullet/SharedMemory/udp")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/bullet/SimpleOpenGL3")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/bullet/StandaloneMain")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/bullet/ThirdPartyLibs/Gwen/Controls/Dialog")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/bullet/ThirdPartyLibs/Gwen/Platforms")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/bullet/ThirdPartyLibs/lua-5.2.3/lua_compiler")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/bullet/ThirdPartyLibs/lua-5.2.3/lua_standalone")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/bullet/ThirdPartyLibs/openvr/bin")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/bullet/ThirdPartyLibs/openvr/lib")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/bullet/ThirdPartyLibs/serial/src")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/bullet/TwoJoint")

vcpkg_copy_pdbs()

file(INSTALL "${SOURCE_PATH}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
