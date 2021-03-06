# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

get_filename_component(
    _qt_install_prefix "${CMAKE_CURRENT_LIST_DIR}/../../.." ABSOLUTE
)

# Define:
# * _qt_is_static (variable)
# * _qt_cmake_extra_helpers_add_interface (function)
# * _qt_cmake_extra_helpers_add_interface_release_debug (function)
# * _qt_cmake_extra_helpers_add_source (function)
include("${_qt_install_prefix}/cmake/QtCMakeExtraHelpers.cmake")

if(NOT _qt_is_static)
  return()
endif()

if(IOS)
  #
elseif(APPLE)
  # _FSCopyAliasInfo
  _qt_cmake_extra_helpers_add_interface(Qt5::Core "-framework CoreServices")

  # _OBJC_CLASS_$_NSAutoreleasePool
  _qt_cmake_extra_helpers_add_interface(Qt5::Core "-framework Foundation")

  # _pcre16_assign_jit_stack
  _qt_cmake_extra_helpers_add_interface_release_debug(
      Qt5::Core
      "${_qt_install_prefix}/lib/libqtpcre.a"
      "${_qt_install_prefix}/lib/libqtpcre_debug.a"
  )
elseif(UNIX)
  # Linux

  # defined: `ucal_close_52`
  _qt_cmake_extra_helpers_add_interface(Qt5::Core "icui18n")

  _qt_cmake_extra_helpers_add_interface(Qt5::Core "icuuc")

  _qt_cmake_extra_helpers_add_interface(Qt5::Core "dl")
elseif(MSVC)
  #
elseif(MINGW)
  #
endif()
