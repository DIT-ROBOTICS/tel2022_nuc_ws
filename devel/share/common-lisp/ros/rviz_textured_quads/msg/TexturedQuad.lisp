; Auto-generated. Do not edit!


(cl:in-package rviz_textured_quads-msg)


;//! \htmlinclude TexturedQuad.msg.html

(cl:defclass <TexturedQuad> (roslisp-msg-protocol:ros-message)
  ((image
    :reader image
    :initarg :image
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (width
    :reader width
    :initarg :width
    :type cl:float
    :initform 0.0)
   (height
    :reader height
    :initarg :height
    :type cl:float
    :initform 0.0)
   (caption
    :reader caption
    :initarg :caption
    :type cl:string
    :initform "")
   (border_size
    :reader border_size
    :initarg :border_size
    :type cl:float
    :initform 0.0)
   (border_color
    :reader border_color
    :initarg :border_color
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass TexturedQuad (<TexturedQuad>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TexturedQuad>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TexturedQuad)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rviz_textured_quads-msg:<TexturedQuad> is deprecated: use rviz_textured_quads-msg:TexturedQuad instead.")))

(cl:ensure-generic-function 'image-val :lambda-list '(m))
(cl:defmethod image-val ((m <TexturedQuad>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rviz_textured_quads-msg:image-val is deprecated.  Use rviz_textured_quads-msg:image instead.")
  (image m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <TexturedQuad>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rviz_textured_quads-msg:pose-val is deprecated.  Use rviz_textured_quads-msg:pose instead.")
  (pose m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <TexturedQuad>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rviz_textured_quads-msg:width-val is deprecated.  Use rviz_textured_quads-msg:width instead.")
  (width m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <TexturedQuad>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rviz_textured_quads-msg:height-val is deprecated.  Use rviz_textured_quads-msg:height instead.")
  (height m))

(cl:ensure-generic-function 'caption-val :lambda-list '(m))
(cl:defmethod caption-val ((m <TexturedQuad>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rviz_textured_quads-msg:caption-val is deprecated.  Use rviz_textured_quads-msg:caption instead.")
  (caption m))

(cl:ensure-generic-function 'border_size-val :lambda-list '(m))
(cl:defmethod border_size-val ((m <TexturedQuad>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rviz_textured_quads-msg:border_size-val is deprecated.  Use rviz_textured_quads-msg:border_size instead.")
  (border_size m))

(cl:ensure-generic-function 'border_color-val :lambda-list '(m))
(cl:defmethod border_color-val ((m <TexturedQuad>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rviz_textured_quads-msg:border_color-val is deprecated.  Use rviz_textured_quads-msg:border_color instead.")
  (border_color m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TexturedQuad>) ostream)
  "Serializes a message object of type '<TexturedQuad>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'image) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'height))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'caption))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'caption))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'border_size))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'border_color))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'border_color))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TexturedQuad>) istream)
  "Deserializes a message object of type '<TexturedQuad>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'image) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'width) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'height) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'caption) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'caption) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'border_size) (roslisp-utils:decode-single-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'border_color) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'border_color)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TexturedQuad>)))
  "Returns string type for a message object of type '<TexturedQuad>"
  "rviz_textured_quads/TexturedQuad")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TexturedQuad)))
  "Returns string type for a message object of type 'TexturedQuad"
  "rviz_textured_quads/TexturedQuad")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TexturedQuad>)))
  "Returns md5sum for a message object of type '<TexturedQuad>"
  "ca357eef48c96ef31533ee760ce93902")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TexturedQuad)))
  "Returns md5sum for a message object of type 'TexturedQuad"
  "ca357eef48c96ef31533ee760ce93902")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TexturedQuad>)))
  "Returns full string definition for message of type '<TexturedQuad>"
  (cl:format cl:nil "sensor_msgs/Image 	image  			# texture ~%geometry_msgs/Pose 	pose   			# 6DOF pose of the center of the quad to be displayed~%float32 			width		    # physical width of the quad in Rviz unit (usually meters) ~%float32 			height			# physical height of the quad in Rviz unit (usually meters) ~%string 				caption		    # [OPTIONAL] text description to appear below the quad~%float32 			border_size     # [OPTIONAL] size of the quad border~%float32[] 			border_color    # [OPTIONAL] (r,g,b,a) color value of the quad border (Size = 4) ~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TexturedQuad)))
  "Returns full string definition for message of type 'TexturedQuad"
  (cl:format cl:nil "sensor_msgs/Image 	image  			# texture ~%geometry_msgs/Pose 	pose   			# 6DOF pose of the center of the quad to be displayed~%float32 			width		    # physical width of the quad in Rviz unit (usually meters) ~%float32 			height			# physical height of the quad in Rviz unit (usually meters) ~%string 				caption		    # [OPTIONAL] text description to appear below the quad~%float32 			border_size     # [OPTIONAL] size of the quad border~%float32[] 			border_color    # [OPTIONAL] (r,g,b,a) color value of the quad border (Size = 4) ~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TexturedQuad>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'image))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     4
     4
     4 (cl:length (cl:slot-value msg 'caption))
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'border_color) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TexturedQuad>))
  "Converts a ROS message object to a list"
  (cl:list 'TexturedQuad
    (cl:cons ':image (image msg))
    (cl:cons ':pose (pose msg))
    (cl:cons ':width (width msg))
    (cl:cons ':height (height msg))
    (cl:cons ':caption (caption msg))
    (cl:cons ':border_size (border_size msg))
    (cl:cons ':border_color (border_color msg))
))
