(defun process (one)
  (print "new")
  (print one)
  (print (to-cart one))
  (print (to-polar one))
  (print (to-cart (to-polar one)))
  (print (to-polar (to-cart one)))
)
(process (make-instance 'cart :x 1 :y 1))
(process (make-instance 'polar :angle 0.5 :radius 1.4142))

(setf non-equal-cart (make-instance 'triangle
  :1 (make-instance 'cart :x 0 :y 0)
  :2 (make-instance 'cart :x 0 :y 1)
  :3 (make-instance 'cart :x 1 :y 0)
))

(setf equal-cart (make-instance 'triangle
  :1 (make-instance 'cart :x 0 :y 0)
  :2 (make-instance 'cart :x 0.5 :y 0)
  :3 (make-instance 'cart :x 0.25 :y 0.4330127)
))


(setf non-equal-polar (make-instance 'triangle
  :1 (make-instance 'polar :radius 0 :angle 0)
  :2 (make-instance 'polar :radius 1 :angle (/ pi 2))
  :3 (make-instance 'polar :radius 1 :angle 0)
))

(setf equal-polar (make-instance 'triangle
  :1 (make-instance 'polar :radius 0   :angle 0)
  :2 (make-instance 'polar :radius 0.5 :angle 0)
  :3 (make-instance 'polar :radius 0.5 :angle (* pi (/ 3 4)))
))


(print (равносторонний-p non-equal-cart))
(print (равносторонний-p equal-cart))

(print (равносторонний-p non-equal-polar))
(print (равносторонний-p equal-polar))