(defun pow2 (x) (* x x))

(defclass cart () (
    (x :initarg :x :reader cart-x)
    (y :initarg :y :reader cart-y)
  )
)
(defmethod name ((c cart)) "cart")
(defmethod distance-to ((from cart) (to cart))
  (sqrt
    (+
      (pow2 (- (cart-x from) (cart-x to)))
      (pow2 (- (cart-y from) (cart-y to)))
    )
  )
)
(defmethod print-object ((c cart) stream)
  (format stream "[CART x ~d y ~d]"
          (cart-x c) (cart-y c))
)

(defclass polar () (
    (radius :initarg :radius :reader radius)
    (angle  :initarg :angle  :reader angle)
  )
)
(defmethod name ((p polar)) "polar")
(defmethod distance-to ((from polar) (to polar))
  (error "TODO")
)
(defmethod print-object ((p polar) stream)
  (format stream "[POLAR radius ~d angle ~d]"
          (radius p) (angle p))
)


; cart methods
(defmethod to-cart  ((c cart)) (make-instance 'cart :x (cart-x c) :y (cart-y c)))
(defmethod to-polar ((c cart))
  (setf y-is-null (= 0 (cart-y c)))
  (setf x-is-null (= 0 (cart-x c)))
  (make-instance 'polar
    :radius (sqrt (+ (pow2 (cart-x c)) (pow2 (cart-y c))))
    :angle
    (cond
      ( (and x-is-null y-is-null) 0)
      ( y-is-null 0)
      ( (and (not y-is-null) (not x-is-null)) (atan (/ (cart-y c) (cart-x c))))
      ( (and (not y-is-null) x-is-null)
        (*
          (/ pi 2)
          (if (> (cart-y c) 0) 1 -1)
        )
      )
    )
  )
)

; polar methods
(defmethod to-polar ((p polar)) (make-instance 'polar :radius (radius p) :angle (angle p)))
(defmethod to-cart  ((p polar))
  (make-instance 'cart
    :x (* (radius p) (cos (angle p)))
    :y (* (radius p) (sin (angle p)))
  )
)

; triangle class definition
(defclass triangle () (
    (vertex1 :initarg :1 :reader vertex1 :initform (error "vertex1 must be declared"))
    (vertex2 :initarg :2 :reader vertex2 :initform (error "vertex2 must be declared"))
    (vertex3 :initarg :3 :reader vertex3 :initform (error "vertex3 must be declared"))
  )
)
(defmethod print-object ((tri triangle) stream)
  (format stream "[TRI ~s ~s ~s]"
          (vertex1 tri) (vertex2 tri) (vertex3 tri))
)

(defun max-in-list (types)
  (loop
    with carts  = 0
    with polars = 0
    for typ in types
    when (string= typ "cart")  do (incf carts)
    when (string= typ "polar") do (incf polars)
    finally (return (if (> carts polars) "cart" "polar"))
  )
)

; приводит вершину к типу `typ`
(defun cast-vertex (vtx typ)
  (cond
    ( (string= typ "cart")  (to-cart  vtx))
    ( (string= typ "polar") (to-polar vtx))
  )
)

(defmethod cast-to ((tri triangle) typ)
  (make-instance 'triangle
    :1 (cast-vertex (vertex1 tri) typ)
    :2 (cast-vertex (vertex2 tri) typ)
    :3 (cast-vertex (vertex3 tri) typ)
  )
)

(defun in-eps (x y eps)
  (<
    (/ (abs (- x y)) (abs x))
    eps
  )
)

(defmethod is-equilateral-p ((tri triangle))
  (let (
      (eps 1e-5)
      (a (distance-to (vertex1 tri) (vertex2 tri)))
      (b (distance-to (vertex2 tri) (vertex3 tri)))
      (c (distance-to (vertex3 tri) (vertex1 tri)))
    )
    (print a)
    (print b)
    (print c)
    (and
      (in-eps a b eps)
      (in-eps b c eps)
      (in-eps c a eps)
    )
  )
)

;ну не нравится мне кириллица в коде
(defmethod равносторонний-p ((tri triangle))
  (setf max-type (max-in-list (list
    (name (vertex1 tri))
    (name (vertex2 tri))
    (name (vertex3 tri))
  )))
  (print max-type)
  (cond
    ( (string= max-type "cart")  (is-equilateral-p (cast-to tri "cart")))
    ( (string= max-type "polar") (is-equilateral-p (cast-to tri "polar")))
  )
)
