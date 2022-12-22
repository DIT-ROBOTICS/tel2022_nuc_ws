// Auto-generated. Do not edit!

// (in-package rviz_textured_quads.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let TexturedQuad = require('./TexturedQuad.js');

//-----------------------------------------------------------

class TexturedQuadArray {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.quads = null;
    }
    else {
      if (initObj.hasOwnProperty('quads')) {
        this.quads = initObj.quads
      }
      else {
        this.quads = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TexturedQuadArray
    // Serialize message field [quads]
    // Serialize the length for message field [quads]
    bufferOffset = _serializer.uint32(obj.quads.length, buffer, bufferOffset);
    obj.quads.forEach((val) => {
      bufferOffset = TexturedQuad.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TexturedQuadArray
    let len;
    let data = new TexturedQuadArray(null);
    // Deserialize message field [quads]
    // Deserialize array length for message field [quads]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.quads = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.quads[i] = TexturedQuad.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.quads.forEach((val) => {
      length += TexturedQuad.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rviz_textured_quads/TexturedQuadArray';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8682a94b73fe5b827efa6a32bb422a7a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    TexturedQuad[] quads 
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TexturedQuadArray(null);
    if (msg.quads !== undefined) {
      resolved.quads = new Array(msg.quads.length);
      for (let i = 0; i < resolved.quads.length; ++i) {
        resolved.quads[i] = TexturedQuad.Resolve(msg.quads[i]);
      }
    }
    else {
      resolved.quads = []
    }

    return resolved;
    }
};

module.exports = TexturedQuadArray;
