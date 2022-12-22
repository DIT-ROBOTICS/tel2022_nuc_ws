
(cl:in-package :asdf)

(defsystem "rviz_textured_quads-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "TexturedQuad" :depends-on ("_package_TexturedQuad"))
    (:file "_package_TexturedQuad" :depends-on ("_package"))
    (:file "TexturedQuadArray" :depends-on ("_package_TexturedQuadArray"))
    (:file "_package_TexturedQuadArray" :depends-on ("_package"))
  ))