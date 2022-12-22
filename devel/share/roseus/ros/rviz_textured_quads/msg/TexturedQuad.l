;; Auto-generated. Do not edit!


(when (boundp 'rviz_textured_quads::TexturedQuad)
  (if (not (find-package "RVIZ_TEXTURED_QUADS"))
    (make-package "RVIZ_TEXTURED_QUADS"))
  (shadow 'TexturedQuad (find-package "RVIZ_TEXTURED_QUADS")))
(unless (find-package "RVIZ_TEXTURED_QUADS::TEXTUREDQUAD")
  (make-package "RVIZ_TEXTURED_QUADS::TEXTUREDQUAD"))

(in-package "ROS")
;;//! \htmlinclude TexturedQuad.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass rviz_textured_quads::TexturedQuad
  :super ros::object
  :slots (_image _pose _width _height _caption _border_size _border_color ))

(defmethod rviz_textured_quads::TexturedQuad
  (:init
   (&key
    ((:image __image) (instance sensor_msgs::Image :init))
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:width __width) 0.0)
    ((:height __height) 0.0)
    ((:caption __caption) "")
    ((:border_size __border_size) 0.0)
    ((:border_color __border_color) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _image __image)
   (setq _pose __pose)
   (setq _width (float __width))
   (setq _height (float __height))
   (setq _caption (string __caption))
   (setq _border_size (float __border_size))
   (setq _border_color __border_color)
   self)
  (:image
   (&rest __image)
   (if (keywordp (car __image))
       (send* _image __image)
     (progn
       (if __image (setq _image (car __image)))
       _image)))
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:caption
   (&optional __caption)
   (if __caption (setq _caption __caption)) _caption)
  (:border_size
   (&optional __border_size)
   (if __border_size (setq _border_size __border_size)) _border_size)
  (:border_color
   (&optional __border_color)
   (if __border_color (setq _border_color __border_color)) _border_color)
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/Image _image
    (send _image :serialization-length)
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; float32 _width
    4
    ;; float32 _height
    4
    ;; string _caption
    4 (length _caption)
    ;; float32 _border_size
    4
    ;; float32[] _border_color
    (* 4    (length _border_color)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/Image _image
       (send _image :serialize s)
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; float32 _width
       (sys::poke _width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _height
       (sys::poke _height (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _caption
       (write-long (length _caption) s) (princ _caption s)
     ;; float32 _border_size
       (sys::poke _border_size (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32[] _border_color
     (write-long (length _border_color) s)
     (dotimes (i (length _border_color))
       (sys::poke (elt _border_color i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/Image _image
     (send _image :deserialize buf ptr-) (incf ptr- (send _image :serialization-length))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; float32 _width
     (setq _width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _height
     (setq _height (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _caption
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _caption (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _border_size
     (setq _border_size (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32[] _border_color
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _border_color (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _border_color i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get rviz_textured_quads::TexturedQuad :md5sum-) "ca357eef48c96ef31533ee760ce93902")
(setf (get rviz_textured_quads::TexturedQuad :datatype-) "rviz_textured_quads/TexturedQuad")
(setf (get rviz_textured_quads::TexturedQuad :definition-)
      "sensor_msgs/Image 	image  			# texture 
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



(provide :rviz_textured_quads/TexturedQuad "ca357eef48c96ef31533ee760ce93902")


