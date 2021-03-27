
(defun app (l k)
  (if (endp l) k
        (cons (car l)
            (app (cdr l) k))))

(defthm theorem
    (equal (app l (app k j)) (app (app l k) j))
    :rule-classes nil
)
