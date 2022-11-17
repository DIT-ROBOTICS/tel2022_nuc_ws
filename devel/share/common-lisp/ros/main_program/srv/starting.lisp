; Auto-generated. Do not edit!


(cl:in-package main_program-srv)


;//! \htmlinclude starting-request.msg.html

(cl:defclass <starting-request> (roslisp-msg-protocol:ros-message)
  ((startStatus
    :reader startStatus
    :initarg :startStatus
    :type cl:fixnum
    :initform 0)
   (startTrigger
    :reader startTrigger
    :initarg :startTrigger
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass starting-request (<starting-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <starting-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'starting-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name main_program-srv:<starting-request> is deprecated: use main_program-srv:starting-request instead.")))

(cl:ensure-generic-function 'startStatus-val :lambda-list '(m))
(cl:defmethod startStatus-val ((m <starting-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader main_program-srv:startStatus-val is deprecated.  Use main_program-srv:startStatus instead.")
  (startStatus m))

(cl:ensure-generic-function 'startTrigger-val :lambda-list '(m))
(cl:defmethod startTrigger-val ((m <starting-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader main_program-srv:startTrigger-val is deprecated.  Use main_program-srv:startTrigger instead.")
  (startTrigger m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <starting-request>) ostream)
  "Serializes a message object of type '<starting-request>"
  (cl:let* ((signed (cl:slot-value msg 'startStatus)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'startTrigger) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <starting-request>) istream)
  "Deserializes a message object of type '<starting-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'startStatus) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:slot-value msg 'startTrigger) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<starting-request>)))
  "Returns string type for a service object of type '<starting-request>"
  "main_program/startingRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'starting-request)))
  "Returns string type for a service object of type 'starting-request"
  "main_program/startingRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<starting-request>)))
  "Returns md5sum for a message object of type '<starting-request>"
  "8e6928b31eac7bd32f54443af440aaac")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'starting-request)))
  "Returns md5sum for a message object of type 'starting-request"
  "8e6928b31eac7bd32f54443af440aaac")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<starting-request>)))
  "Returns full string definition for message of type '<starting-request>"
  (cl:format cl:nil "int16 startStatus~%bool startTrigger~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'starting-request)))
  "Returns full string definition for message of type 'starting-request"
  (cl:format cl:nil "int16 startStatus~%bool startTrigger~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <starting-request>))
  (cl:+ 0
     2
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <starting-request>))
  "Converts a ROS message object to a list"
  (cl:list 'starting-request
    (cl:cons ':startStatus (startStatus msg))
    (cl:cons ':startTrigger (startTrigger msg))
))
;//! \htmlinclude starting-response.msg.html

(cl:defclass <starting-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass starting-response (<starting-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <starting-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'starting-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name main_program-srv:<starting-response> is deprecated: use main_program-srv:starting-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <starting-response>) ostream)
  "Serializes a message object of type '<starting-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <starting-response>) istream)
  "Deserializes a message object of type '<starting-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<starting-response>)))
  "Returns string type for a service object of type '<starting-response>"
  "main_program/startingResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'starting-response)))
  "Returns string type for a service object of type 'starting-response"
  "main_program/startingResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<starting-response>)))
  "Returns md5sum for a message object of type '<starting-response>"
  "8e6928b31eac7bd32f54443af440aaac")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'starting-response)))
  "Returns md5sum for a message object of type 'starting-response"
  "8e6928b31eac7bd32f54443af440aaac")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<starting-response>)))
  "Returns full string definition for message of type '<starting-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'starting-response)))
  "Returns full string definition for message of type 'starting-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <starting-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <starting-response>))
  "Converts a ROS message object to a list"
  (cl:list 'starting-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'starting)))
  'starting-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'starting)))
  'starting-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'starting)))
  "Returns string type for a service object of type '<starting>"
  "main_program/starting")