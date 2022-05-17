// Auto-generated. Do not edit!

// (in-package ego_planner.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class Bspline {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.order = null;
      this.traj_id = null;
      this.start_time = null;
      this.knots = null;
      this.pos_pts = null;
      this.yaw_pts = null;
      this.yaw_dt = null;
    }
    else {
      if (initObj.hasOwnProperty('order')) {
        this.order = initObj.order
      }
      else {
        this.order = 0;
      }
      if (initObj.hasOwnProperty('traj_id')) {
        this.traj_id = initObj.traj_id
      }
      else {
        this.traj_id = 0;
      }
      if (initObj.hasOwnProperty('start_time')) {
        this.start_time = initObj.start_time
      }
      else {
        this.start_time = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('knots')) {
        this.knots = initObj.knots
      }
      else {
        this.knots = [];
      }
      if (initObj.hasOwnProperty('pos_pts')) {
        this.pos_pts = initObj.pos_pts
      }
      else {
        this.pos_pts = [];
      }
      if (initObj.hasOwnProperty('yaw_pts')) {
        this.yaw_pts = initObj.yaw_pts
      }
      else {
        this.yaw_pts = [];
      }
      if (initObj.hasOwnProperty('yaw_dt')) {
        this.yaw_dt = initObj.yaw_dt
      }
      else {
        this.yaw_dt = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Bspline
    // Serialize message field [order]
    bufferOffset = _serializer.int32(obj.order, buffer, bufferOffset);
    // Serialize message field [traj_id]
    bufferOffset = _serializer.int64(obj.traj_id, buffer, bufferOffset);
    // Serialize message field [start_time]
    bufferOffset = _serializer.time(obj.start_time, buffer, bufferOffset);
    // Serialize message field [knots]
    bufferOffset = _arraySerializer.float64(obj.knots, buffer, bufferOffset, null);
    // Serialize message field [pos_pts]
    // Serialize the length for message field [pos_pts]
    bufferOffset = _serializer.uint32(obj.pos_pts.length, buffer, bufferOffset);
    obj.pos_pts.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [yaw_pts]
    bufferOffset = _arraySerializer.float64(obj.yaw_pts, buffer, bufferOffset, null);
    // Serialize message field [yaw_dt]
    bufferOffset = _serializer.float64(obj.yaw_dt, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Bspline
    let len;
    let data = new Bspline(null);
    // Deserialize message field [order]
    data.order = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [traj_id]
    data.traj_id = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [start_time]
    data.start_time = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [knots]
    data.knots = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [pos_pts]
    // Deserialize array length for message field [pos_pts]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.pos_pts = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.pos_pts[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [yaw_pts]
    data.yaw_pts = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [yaw_dt]
    data.yaw_dt = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.knots.length;
    length += 24 * object.pos_pts.length;
    length += 8 * object.yaw_pts.length;
    return length + 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ego_planner/Bspline';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b352d4f7278a546180de67cbe6793e49';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 order
    int64 traj_id
    time start_time
    
    float64[] knots
    geometry_msgs/Point[] pos_pts
    
    float64[] yaw_pts
    float64 yaw_dt
    
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Bspline(null);
    if (msg.order !== undefined) {
      resolved.order = msg.order;
    }
    else {
      resolved.order = 0
    }

    if (msg.traj_id !== undefined) {
      resolved.traj_id = msg.traj_id;
    }
    else {
      resolved.traj_id = 0
    }

    if (msg.start_time !== undefined) {
      resolved.start_time = msg.start_time;
    }
    else {
      resolved.start_time = {secs: 0, nsecs: 0}
    }

    if (msg.knots !== undefined) {
      resolved.knots = msg.knots;
    }
    else {
      resolved.knots = []
    }

    if (msg.pos_pts !== undefined) {
      resolved.pos_pts = new Array(msg.pos_pts.length);
      for (let i = 0; i < resolved.pos_pts.length; ++i) {
        resolved.pos_pts[i] = geometry_msgs.msg.Point.Resolve(msg.pos_pts[i]);
      }
    }
    else {
      resolved.pos_pts = []
    }

    if (msg.yaw_pts !== undefined) {
      resolved.yaw_pts = msg.yaw_pts;
    }
    else {
      resolved.yaw_pts = []
    }

    if (msg.yaw_dt !== undefined) {
      resolved.yaw_dt = msg.yaw_dt;
    }
    else {
      resolved.yaw_dt = 0.0
    }

    return resolved;
    }
};

module.exports = Bspline;
