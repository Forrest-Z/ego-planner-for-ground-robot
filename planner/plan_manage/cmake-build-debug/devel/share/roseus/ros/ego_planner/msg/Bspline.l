;; Auto-generated. Do not edit!


(when (boundp 'ego_planner::Bspline)
  (if (not (find-package "EGO_PLANNER"))
    (make-package "EGO_PLANNER"))
  (shadow 'Bspline (find-package "EGO_PLANNER")))
(unless (find-package "EGO_PLANNER::BSPLINE")
  (make-package "EGO_PLANNER::BSPLINE"))

(in-package "ROS")
;;//! \htmlinclude Bspline.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass ego_planner::Bspline
  :super ros::object
  :slots (_order _traj_id _start_time _knots _pos_pts _yaw_pts _yaw_dt ))

(defmethod ego_planner::Bspline
  (:init
   (&key
    ((:order __order) 0)
    ((:traj_id __traj_id) 0)
    ((:start_time __start_time) (instance ros::time :init))
    ((:knots __knots) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:pos_pts __pos_pts) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point :init) r)) r))
    ((:yaw_pts __yaw_pts) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:yaw_dt __yaw_dt) 0.0)
    )
   (send-super :init)
   (setq _order (round __order))
   (setq _traj_id (round __traj_id))
   (setq _start_time __start_time)
   (setq _knots __knots)
   (setq _pos_pts __pos_pts)
   (setq _yaw_pts __yaw_pts)
   (setq _yaw_dt (float __yaw_dt))
   self)
  (:order
   (&optional __order)
   (if __order (setq _order __order)) _order)
  (:traj_id
   (&optional __traj_id)
   (if __traj_id (setq _traj_id __traj_id)) _traj_id)
  (:start_time
   (&optional __start_time)
   (if __start_time (setq _start_time __start_time)) _start_time)
  (:knots
   (&optional __knots)
   (if __knots (setq _knots __knots)) _knots)
  (:pos_pts
   (&rest __pos_pts)
   (if (keywordp (car __pos_pts))
       (send* _pos_pts __pos_pts)
     (progn
       (if __pos_pts (setq _pos_pts (car __pos_pts)))
       _pos_pts)))
  (:yaw_pts
   (&optional __yaw_pts)
   (if __yaw_pts (setq _yaw_pts __yaw_pts)) _yaw_pts)
  (:yaw_dt
   (&optional __yaw_dt)
   (if __yaw_dt (setq _yaw_dt __yaw_dt)) _yaw_dt)
  (:serialization-length
   ()
   (+
    ;; int32 _order
    4
    ;; int64 _traj_id
    8
    ;; time _start_time
    8
    ;; float64[] _knots
    (* 8    (length _knots)) 4
    ;; geometry_msgs/Point[] _pos_pts
    (apply #'+ (send-all _pos_pts :serialization-length)) 4
    ;; float64[] _yaw_pts
    (* 8    (length _yaw_pts)) 4
    ;; float64 _yaw_dt
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _order
       (write-long _order s)
     ;; int64 _traj_id
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _traj_id (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _traj_id) (= (length (_traj_id . bv)) 2)) ;; bignum
              (write-long (ash (elt (_traj_id . bv) 0) 0) s)
              (write-long (ash (elt (_traj_id . bv) 1) -1) s))
             ((and (class _traj_id) (= (length (_traj_id . bv)) 1)) ;; big1
              (write-long (elt (_traj_id . bv) 0) s)
              (write-long (if (>= _traj_id 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _traj_id s)(write-long (if (>= _traj_id 0) 0 #xffffffff) s)))
     ;; time _start_time
       (write-long (send _start_time :sec) s) (write-long (send _start_time :nsec) s)
     ;; float64[] _knots
     (write-long (length _knots) s)
     (dotimes (i (length _knots))
       (sys::poke (elt _knots i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; geometry_msgs/Point[] _pos_pts
     (write-long (length _pos_pts) s)
     (dolist (elem _pos_pts)
       (send elem :serialize s)
       )
     ;; float64[] _yaw_pts
     (write-long (length _yaw_pts) s)
     (dotimes (i (length _yaw_pts))
       (sys::poke (elt _yaw_pts i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _yaw_dt
       (sys::poke _yaw_dt (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _order
     (setq _order (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int64 _traj_id
#+(or :alpha :irix6 :x86_64)
      (setf _traj_id (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _traj_id (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; time _start_time
     (send _start_time :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _start_time :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64[] _knots
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _knots (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _knots i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; geometry_msgs/Point[] _pos_pts
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pos_pts (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _pos_pts)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; float64[] _yaw_pts
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _yaw_pts (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _yaw_pts i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64 _yaw_dt
     (setq _yaw_dt (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get ego_planner::Bspline :md5sum-) "b352d4f7278a546180de67cbe6793e49")
(setf (get ego_planner::Bspline :datatype-) "ego_planner/Bspline")
(setf (get ego_planner::Bspline :definition-)
      "int32 order
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

")



(provide :ego_planner/Bspline "b352d4f7278a546180de67cbe6793e49")


