;; Auto-generated. Do not edit!


(when (boundp 'rviz_textured_quads::TexturedQuadArray)
  (if (not (find-package "RVIZ_TEXTURED_QUADS"))
    (make-package "RVIZ_TEXTURED_QUADS"))
  (shadow 'TexturedQuadArray (find-package "RVIZ_TEXTURED_QUADS")))
(unless (find-package "RVIZ_TEXTURED_QUADS::TEXTUREDQUADARRAY")
  (make-package "RVIZ_TEXTURED_QUADS::TEXTUREDQUADARRAY"))

(in-package "ROS")
;;//! \htmlinclude TexturedQuadArray.msg.html


(defclass rviz_textured_quads::TexturedQuadArray
  :super ros::object
  :slots (_quads ))

(defmethod rviz_textured_quads::TexturedQuadArray
  (:init
   (&key
    ((:quads __quads) ())
    )
   (send-super :init)
   (setq _quads __quads)
   self)
  (:quads
   (&rest __quads)
   (if (keywordp (car __quads))
       (send* _quads __quads)
     (progn
       (if __quads (setq _quads (car __quads)))
       _quads)))
  (:serialization-length
   ()
   (+
    ;; rviz_textured_quads/TexturedQuad[] _quads
    (apply #'+ (send-all _quads :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; rviz_textured_quads/TexturedQuad[] _quads
     (write-long (length _quads) s)
     (dolist (elem _quads)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; rviz_textured_quads/TexturedQuad[] _quads
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _quads (let (r) (dotimes (i n) (push (instance rviz_textured_quads::TexturedQuad :init) r)) r))
     (dolist (elem- _quads)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get rviz_textured_quads::TexturedQuadArray :md5sum-) "8682a94b73fe5b827efa6a32bb422a7a")
(setf (get rviz_textured_quads::TexturedQuadArray :datatype-) "rviz_textured_quads/TexturedQuadArray")
(setf (get rviz_textured_quads::TexturedQuadArray :definition-)
      "TexturedQuad[] quads 
================================================================================
MSG: rviz_textured_quads/TexturedQuad
sensor_msgs/Image 	image  			# texture 
geometry_msgs/Pose 	pose   			# 6DOF pose of the center of the quad to be displayed
float32 			width		    # physical width of the quad in Rviz unit (usually meters) 
float32 			height			# physical height of the quad in Rviz unit (usually meters) 
string 				caption		    # [OPTIONAL] text description to appear below the quad
float32 			border_size     # [OPTIONAL] size of the quad border
float32[] 			border_color    # [OPTIONAL] (r,g,b,a) color value of the quad border (Size = 4) 
================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :rviz_textured_quads/TexturedQuadArray "8682a94b73fe5b827efa6a32bb422a7a")


