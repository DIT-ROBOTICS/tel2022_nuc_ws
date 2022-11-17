# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "main_program: 1 messages, 1 services")

set(MSG_I_FLAGS "-Imain_program:/home/dit_nuc/tel2022_nuc_ws/src/main_program/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(main_program_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/dit_nuc/tel2022_nuc_ws/src/main_program/msg/mission.msg" NAME_WE)
add_custom_target(_main_program_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "main_program" "/home/dit_nuc/tel2022_nuc_ws/src/main_program/msg/mission.msg" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/dit_nuc/tel2022_nuc_ws/src/main_program/srv/starting.srv" NAME_WE)
add_custom_target(_main_program_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "main_program" "/home/dit_nuc/tel2022_nuc_ws/src/main_program/srv/starting.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(main_program
  "/home/dit_nuc/tel2022_nuc_ws/src/main_program/msg/mission.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/main_program
)

### Generating Services
_generate_srv_cpp(main_program
  "/home/dit_nuc/tel2022_nuc_ws/src/main_program/srv/starting.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/main_program
)

### Generating Module File
_generate_module_cpp(main_program
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/main_program
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(main_program_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(main_program_generate_messages main_program_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dit_nuc/tel2022_nuc_ws/src/main_program/msg/mission.msg" NAME_WE)
add_dependencies(main_program_generate_messages_cpp _main_program_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dit_nuc/tel2022_nuc_ws/src/main_program/srv/starting.srv" NAME_WE)
add_dependencies(main_program_generate_messages_cpp _main_program_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(main_program_gencpp)
add_dependencies(main_program_gencpp main_program_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS main_program_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(main_program
  "/home/dit_nuc/tel2022_nuc_ws/src/main_program/msg/mission.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/main_program
)

### Generating Services
_generate_srv_eus(main_program
  "/home/dit_nuc/tel2022_nuc_ws/src/main_program/srv/starting.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/main_program
)

### Generating Module File
_generate_module_eus(main_program
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/main_program
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(main_program_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(main_program_generate_messages main_program_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dit_nuc/tel2022_nuc_ws/src/main_program/msg/mission.msg" NAME_WE)
add_dependencies(main_program_generate_messages_eus _main_program_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dit_nuc/tel2022_nuc_ws/src/main_program/srv/starting.srv" NAME_WE)
add_dependencies(main_program_generate_messages_eus _main_program_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(main_program_geneus)
add_dependencies(main_program_geneus main_program_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS main_program_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(main_program
  "/home/dit_nuc/tel2022_nuc_ws/src/main_program/msg/mission.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/main_program
)

### Generating Services
_generate_srv_lisp(main_program
  "/home/dit_nuc/tel2022_nuc_ws/src/main_program/srv/starting.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/main_program
)

### Generating Module File
_generate_module_lisp(main_program
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/main_program
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(main_program_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(main_program_generate_messages main_program_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dit_nuc/tel2022_nuc_ws/src/main_program/msg/mission.msg" NAME_WE)
add_dependencies(main_program_generate_messages_lisp _main_program_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dit_nuc/tel2022_nuc_ws/src/main_program/srv/starting.srv" NAME_WE)
add_dependencies(main_program_generate_messages_lisp _main_program_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(main_program_genlisp)
add_dependencies(main_program_genlisp main_program_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS main_program_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(main_program
  "/home/dit_nuc/tel2022_nuc_ws/src/main_program/msg/mission.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/main_program
)

### Generating Services
_generate_srv_nodejs(main_program
  "/home/dit_nuc/tel2022_nuc_ws/src/main_program/srv/starting.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/main_program
)

### Generating Module File
_generate_module_nodejs(main_program
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/main_program
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(main_program_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(main_program_generate_messages main_program_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dit_nuc/tel2022_nuc_ws/src/main_program/msg/mission.msg" NAME_WE)
add_dependencies(main_program_generate_messages_nodejs _main_program_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dit_nuc/tel2022_nuc_ws/src/main_program/srv/starting.srv" NAME_WE)
add_dependencies(main_program_generate_messages_nodejs _main_program_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(main_program_gennodejs)
add_dependencies(main_program_gennodejs main_program_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS main_program_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(main_program
  "/home/dit_nuc/tel2022_nuc_ws/src/main_program/msg/mission.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/main_program
)

### Generating Services
_generate_srv_py(main_program
  "/home/dit_nuc/tel2022_nuc_ws/src/main_program/srv/starting.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/main_program
)

### Generating Module File
_generate_module_py(main_program
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/main_program
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(main_program_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(main_program_generate_messages main_program_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dit_nuc/tel2022_nuc_ws/src/main_program/msg/mission.msg" NAME_WE)
add_dependencies(main_program_generate_messages_py _main_program_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dit_nuc/tel2022_nuc_ws/src/main_program/srv/starting.srv" NAME_WE)
add_dependencies(main_program_generate_messages_py _main_program_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(main_program_genpy)
add_dependencies(main_program_genpy main_program_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS main_program_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/main_program)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/main_program
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(main_program_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/main_program)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/main_program
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(main_program_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/main_program)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/main_program
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(main_program_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/main_program)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/main_program
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(main_program_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/main_program)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/main_program\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/main_program
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(main_program_generate_messages_py geometry_msgs_generate_messages_py)
endif()
