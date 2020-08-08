(defun list-sum (lst)
  (cond
    ( (null lst) 0                                      )
    ( t          (+ (first lst) (list-sum (rest lst)) ) )
  )
)