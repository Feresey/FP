(defun count-substring (substr source)
    (loop
      for last-pos = 0 then (+ cur-pos last-pos (length substr))
      for cur-pos = (search substr (subseq source last-pos))
      while cur-pos
      count cur-pos
    )
)