(defun square (a) (* a a))

(defun compare (ab bc cd)
  (cond 
    ( (and (and      ab       bc )      cd )  1)
    ( (and (and (not ab) (not bc)) (not cd)) -1)
    ( t                                       0)
  )
)

(defun four-sorted (a b c d)
  (setq result (compare (<= a b) (<= b c) (<= c d)))
  (cond
    (
      (= result 1)
      (values (square a) (square b) (square c) (square d))
    )
    (
      (= result -1)
      (values a b c d)
    )
    (
      (= result 0)
      (max a b c d)
    )
  )
)
