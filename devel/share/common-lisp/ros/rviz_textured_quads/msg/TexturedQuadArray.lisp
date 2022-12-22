; Auto-generated. Do not edit!


(cl:in-package rviz_textured_quads-msg)


;//! \htmlinclude TexturedQuadArray.msg.html

(cl:defclass <TexturedQuadArray> (roslisp-msg-protocol:ros-message)
  ((quads
    :reader quads
    :initarg :quads
    :type (cl:vector rviz_textured_quads-msg:TexturedQuad)
   :initform (cl:make-array 0 :element-type 'rviz_textured_quads-msg:TexturedQuad :initial-element (cl:make-instance 'rviz_textured_quads-msg:TexturedQuad))))
)

(cl:defclass TexturedQuadArray (<TexturedQuadArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TexturedQuadArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TexturedQuadArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rviz_textured_quads-msg:<TexturedQuadArray> is deprecated: use rviz_textured_quads-msg:TexturedQuadArray instead.")))

(cl:ensure-generic-function 'quads-val :lambda-list '(m))
(cl:defmethod quads-val ((m <TexturedQuadArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rviz_textured_quads-msg:quads-val is deprecated.  Use rviz_textured_quads-msg:quads instead.")
  (quads m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TexturedQuadArray>) ostream)
  "Serializes a message object of type '<TexturedQuadArray>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'quads))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'quads))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TexturedQuadArray>) istream)
  "Deserializes a message object of type '<TexturedQuadArray>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'quads) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'quads)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'rviz_textured_quads-msg:TexturedQuad))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TexturedQuadArray>)))
  "Returns string type for a message object of type '<TexturedQuadArray>"
  "rviz_textured_quads/TexturedQuadArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TexturedQuadArray)))
  "Returns string type for a message object of type 'TexturedQuadArray"
  "rviz_textured_quads/TexturedQuadArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TexturedQuadArray>)))
  "Returns md5sum for a message object of type '<TexturedQuadArray>"
  "8682a94b73fe5b827efa6a32bb422a7a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TexturedQuadArray)))
  "Returns md5sum for a message object of type 'TexturedQuadArray"
  "8682a94b73fe5b827efa6a32bb422a7a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TexturedQuadArray>)))
  "Returns full string definition for message of type '<TexturedQuadArray>"
  (cl:format cl:nil "TexturedQuad[] quads ~%================================================================================~%MSG: rviz_textured_quads/TexturedQuad~%sensor_msgs/Image 	image  			# texture ~%geometry_msgs/Pose 	pose   			# 6DOF pose of the center of the quad to be displayed~%float32 			width		    # physical width of the quad in Rviz unit (usually meters) ~%float32 			height			# physical height of the quad in Rviz unit (usually meters) ~%string 				caption		    # [OPTIONAL] text description to appear below the quad~%float32 			border_size     # [OPTIONAL] size of the quad border~%float32[] 			border_color    # [OPTIONAL] (r,g,b,a) color value of the quad border (Size = 4) ~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TexturedQuadArray)))
  "Returns full string definition for message of type 'TexturedQuadArray"
  (cl:format cl:nil "TexturedQuad[] quads ~%================================================================================~%MSG: rviz_textured_quads/TexturedQuad~%sensor_msgs/Image 	image  			# texture ~%geometry_msgs/Pose 	pose   			# 6DOF pose of the center of the quad to be displayed~%float32 			width		    # physical width of the quad in Rviz unit (usually meters) ~%float32 			height			# physical height of the quad in Rviz unit (usually meters) ~%string 				caption		    # [OPTIONAL] text description to appear below the quad~%float32 			border_size     # [OPTIONAL] size of the quad border~%float32[] 			border_color    # [OPTIONAL] (r,g,b,a) color value of the quad border (Size = 4) ~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TexturedQuadArray>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'quads) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TexturedQuadArray>))
  "Converts a ROS message object to a list"
  (cl:list 'TexturedQuadArray
    (cl:cons ':quads (quads msg))
))
