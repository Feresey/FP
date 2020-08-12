(defun count-substring (substr source)
    (loop
      for last-pos = 0 then (+ cur-pos last-pos (length substr))
      for cur-pos = (search substr (subseq source last-pos))
      while cur-pos
      count cur-pos
    )
)

(defun count-substring-recursive (substr source)
  (setf cur-pos (search substr source))
  (cond
    (cur-pos
      (1+
        (count-substring-recursive
          substr
          (subseq source (+ cur-pos (length substr) ))
        )
      )
    )
    (t 0)
  )
)