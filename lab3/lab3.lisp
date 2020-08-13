(defun max-in-lower-triangle (matrix)
  (let (
      (len    (first (array-dimensions matrix)))
      (result (aref matrix 0 0))
    )

    (loop for i from 1 upto (- len 1) do
      (loop for j from 0 upto i do
        (setf elem (aref matrix i j))
        (if (> elem result) (setf result elem) 0)
      )
    )
    result
  )
)