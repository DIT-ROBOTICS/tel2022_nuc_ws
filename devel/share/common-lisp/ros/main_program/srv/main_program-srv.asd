
(cl:in-package :asdf)

(defsystem "main_program-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "starting" :depends-on ("_package_starting"))
    (:file "_package_starting" :depends-on ("_package"))
  ))