;; Auto-generated. Do not edit!


(when (boundp 'main_program::starting)
  (if (not (find-package "MAIN_PROGRAM"))
    (make-package "MAIN_PROGRAM"))
  (shadow 'starting (find-package "MAIN_PROGRAM")))
(unless (find-package "MAIN_PROGRAM::STARTING")
  (make-package "MAIN_PROGRAM::STARTING"))
(unless (find-package "MAIN_PROGRAM::STARTINGREQUEST")
  (make-package "MAIN_PROGRAM::STARTINGREQUEST"))
(unless (find-package "MAIN_PROGRAM::STARTINGRESPONSE")
  (make-package "MAIN_PROGRAM::STARTINGRESPONSE"))

(in-package "ROS")





(defclass main_program::startingRequest
  :super ros::object
  :slots (_startStatus _startTrigger ))

(defmethod main_program::startingRequest
  (:init
   (&key
    ((:startStatus __startStatus) 0)
    ((:startTrigger __startTrigger) nil)
    )
   (send-super :init)
   (setq _startStatus (round __startStatus))
   (setq _startTrigger __startTrigger)
   self)
  (:startStatus
   (&optional __startStatus)
   (if __startStatus (setq _startStatus __startStatus)) _startStatus)
  (:startTrigger
   (&optional (__startTrigger :null))
   (if (not (eq __startTrigger :null)) (setq _startTrigger __startTrigger)) _startTrigger)
  (:serialization-length
   ()
   (+
    ;; int16 _startStatus
    2
    ;; bool _startTrigger
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _startStatus
       (write-word _startStatus s)
     ;; bool _startTrigger
       (if _startTrigger (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _startStatus
     (setq _startStatus (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; bool _startTrigger
     (setq _startTrigger (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass main_program::startingResponse
  :super ros::object
  :slots ())

(defmethod main_program::startingResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass main_program::starting
  :super ros::object
  :slots ())

(setf (get main_program::starting :md5sum-) "8e6928b31eac7bd32f54443af440aaac")
(setf (get main_program::starting :datatype-) "main_program/starting")
(setf (get main_program::starting :request) main_program::startingRequest)
(setf (get main_program::starting :response) main_program::startingResponse)

(defmethod main_program::startingRequest
  (:response () (instance main_program::startingResponse :init)))

(setf (get main_program::startingRequest :md5sum-) "8e6928b31eac7bd32f54443af440aaac")
(setf (get main_program::startingRequest :datatype-) "main_program/startingRequest")
(setf (get main_program::startingRequest :definition-)
      "int16 startStatus
bool startTrigger
---
")

(setf (get main_program::startingResponse :md5sum-) "8e6928b31eac7bd32f54443af440aaac")
(setf (get main_program::startingResponse :datatype-) "main_program/startingResponse")
(setf (get main_program::startingResponse :definition-)
      "int16 startStatus
bool startTrigger
---
")



(provide :main_program/starting "8e6928b31eac7bd32f54443af440aaac")


