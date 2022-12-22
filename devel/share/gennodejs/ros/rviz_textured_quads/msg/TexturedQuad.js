// Auto-generated. Do not edit!

// (in-package rviz_textured_quads.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class TexturedQuad {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.image = null;
      this.pose = null;
      this.width = null;
      this.height = null;
      this.caption = null;
      this.border_size = null;
      this.border_color = null;
    }
    else {
      if (initObj.hasOwnProperty('image')) {
        this.image = initObj.image
      }
      else {
        this.image = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('pose')) {
        this.pose = initObj.pose
      }
      else {
        this.pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0.0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0.0;
      }
      if (initObj.hasOwnProperty('caption')) {
        this.caption = initObj.caption
      }
      else {
        this.caption = '';
      }
      if (initObj.hasOwnProperty('border_size')) {
        this.border_size = initObj.border_size
      }
      else {
        this.border_size = 0.0;
      }
      if (initObj.hasOwnProperty('border_color')) {
        this.border_color = initObj.border_color
      }
      else {
        this.border_color = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TexturedQuad
    // Serialize message field [image]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.image, buffer, bufferOffset);
    // Serialize message field [pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.pose, buffer, bufferOffset);
    // Serialize message field [width]
    bufferOffset = _serializer.float32(obj.width, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.float32(obj.height, buffer, bufferOffset);
    // Serialize message field [caption]
    bufferOffset = _serializer.string(obj.caption, buffer, bufferOffset);
    // Serialize message field [border_size]
    bufferOffset = _serializer.float32(obj.border_size, buffer, bufferOffset);
    // Serialize message field [border_color]
    bufferOffset = _arraySerializer.float32(obj.border_color, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TexturedQuad
    let len;
    let data = new TexturedQuad(null);
    // Deserialize message field [image]
    data.image = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [pose]
    data.pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [width]
    data.width = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [caption]
    data.caption = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [border_size]
    data.border_size = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [border_color]
    data.border_color = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += sensor_msgs.msg.Image.getMessageSize(object.image);
    length += _getByteLength(object.caption);
    length += 4 * object.border_color.length;
    return length + 76;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rviz_textured_quads/TexturedQuad';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ca357eef48c96ef31533ee760ce93902';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TexturedQuad(null);
    if (msg.image !== undefined) {
      resolved.image = sensor_msgs.msg.Image.Resolve(msg.image)
    }
    else {
      resolved.image = new sensor_msgs.msg.Image()
    }

    if (msg.pose !== undefined) {
      resolved.pose = geometry_msgs.msg.Pose.Resolve(msg.pose)
    }
    else {
      resolved.pose = new geometry_msgs.msg.Pose()
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0.0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0.0
    }

    if (msg.caption !== undefined) {
      resolved.caption = msg.caption;
    }
    else {
      resolved.caption = ''
    }

    if (msg.border_size !== undefined) {
      resolved.border_size = msg.border_size;
    }
    else {
      resolved.border_size = 0.0
    }

    if (msg.border_color !== undefined) {
      resolved.border_color = msg.border_color;
    }
    else {
      resolved.border_color = []
    }

    return resolved;
    }
};

module.exports = TexturedQuad;
