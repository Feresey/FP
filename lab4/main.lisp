; 2
(print (count-substring "abcd" "12abcd 345 abcd678"))
; 2
(print (count-substring-recursive "abcd" "12abcd 345 abcd678"))
; 2
(print (count-substring "abab" "12ababab 345 abab 78"))
; 2
(print (count-substring-recursive "abab" "12ababab 345 abab 78"))
; 1
(print (count-substring "1" "1"))
; 1
(print (count-substring-recursive "1" "1"))
; 0
(print (count-substring "1" ""))
; 0
(print (count-substring-recursive "1" ""))
; 4
(print (count-substring "1" "1111"))
; 4
(print (count-substring-recursive "1" "1111"))
; 2
(print (count-substring "1" "2212132"))
; 2
(print (count-substring-recursive "1" "2212132"))