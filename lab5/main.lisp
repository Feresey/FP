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
  :3 (make-instance 'polar :radius 0.5 :angle (/ pi 3 ))
))

(setf non-equal-mixed (make-instance 'triangle
  :1 (make-instance 'cart :x 0 :y 0)
  :3 (make-instance 'cart :x 1 :y 0)
  :2 (make-instance 'polar :radius 1 :angle (/ pi 2))
))

(setf equal-mixed (make-instance 'triangle
  :1 (make-instance 'polar :radius 0   :angle 0)
  :2 (make-instance 'polar :radius 0.5 :angle 0)
  :3 (make-instance 'cart :x 0.25 :y 0.4330127)
))

(setf hard (make-instance 'triangle
  :1 (make-instance 'cart :x 0.88567 :y -0.11103)
  :2 (make-instance 'cart :x -1.04075 :y -0.72484)
  :3 (make-instance 'cart :x -0.60911 :y 1.25039)
))

; NIL
(print (|равносторонний-p| non-equal-cart))
; T
(print (|равносторонний-p| equal-cart))

; NIL
(print (|равносторонний-p| non-equal-polar))
; T
(print (|равносторонний-p| equal-polar))

; NIL
(print (|равносторонний-p| non-equal-mixed))
; T
(print (|равносторонний-p| equal-mixed))
; T
(print (|равносторонний-p| hard))

(print "вырожденные треугольники")

; not fail
(print (|равносторонний-p| (make-instance 'triangle
  :1 (make-instance 'cart)
  :2 (make-instance 'cart)
  :3 (make-instance 'cart)
)))

; not fail
(print (|равносторонний-p| (make-instance 'triangle
  :1 (make-instance 'cart)
  :2 (make-instance 'cart :x 100 :y 100)
  :3 (make-instance 'cart)
)))