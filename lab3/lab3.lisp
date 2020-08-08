(defun matrix-elem (i j matrix) (nth j (nth i matrix)))

(defun max-in-lower-triangle (matrix)
  (let (
      (len       (list-length matrix))
      (result (matrix-elem 0 0 matrix))
    )

    (loop for i from 0 upto (- len 1) do
      (loop for j from 0 upto i do
        (setf elem (matrix-elem i j matrix))
        (if (> elem result) (setf result elem) 0)
      )
    )
    result
  )
)