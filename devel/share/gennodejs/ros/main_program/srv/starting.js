// Auto-generated. Do not edit!

// (in-package main_program.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class startingRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.startStatus = null;
      this.startTrigger = null;
    }
    else {
      if (initObj.hasOwnProperty('startStatus')) {
        this.startStatus = initObj.startStatus
      }
      else {
        this.startStatus = 0;
      }
      if (initObj.hasOwnProperty('startTrigger')) {
        this.startTrigger = initObj.startTrigger
      }
      else {
        this.startTrigger = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type startingRequest
    // Serialize message field [startStatus]
    bufferOffset = _serializer.int16(obj.startStatus, buffer, bufferOffset);
    // Serialize message field [startTrigger]
    bufferOffset = _serializer.bool(obj.startTrigger, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type startingRequest
    let len;
    let data = new startingRequest(null);
    // Deserialize message field [startStatus]
    data.startStatus = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [startTrigger]
    data.startTrigger = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 3;
  }

  static datatype() {
    // Returns string type for a service object
    return 'main_program/startingRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8e6928b31eac7bd32f54443af440aaac';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 startStatus
    bool startTrigger
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new startingRequest(null);
    if (msg.startStatus !== undefined) {
      resolved.startStatus = msg.startStatus;
    }
    else {
      resolved.startStatus = 0
    }

    if (msg.startTrigger !== undefined) {
      resolved.startTrigger = msg.startTrigger;
    }
    else {
      resolved.startTrigger = false
    }

    return resolved;
    }
};

class startingResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type startingResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type startingResponse
    let len;
    let data = new startingResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'main_program/startingResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new startingResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: startingRequest,
  Response: startingResponse,
  md5sum() { return '8e6928b31eac7bd32f54443af440aaac'; },
  datatype() { return 'main_program/starting'; }
};
