; NIL
(print (max-in-lower-triangle nil))
(print (max-in-lower-triangle (list
    '(1 0)
    '(0 1)
    )
  )
)
; 1
(print (max-in-lower-triangle (list
    '(1 1)
    '(1 1)
    )
  )
)
; 9
(print (max-in-lower-triangle (list
    '(1 2 3)
    '(4 5 6)
    '(7 8 9)
    )
  )
)
; 0
(print (max-in-lower-triangle (list
    (list 0 0 9999)
    (list 0 0 9999)
    (list 0 0 0)
    )
  )
)