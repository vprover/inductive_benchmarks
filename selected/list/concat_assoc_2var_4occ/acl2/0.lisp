
(defun app (l k)
  (if (endp l) k
        (cons (car l)
            (app (cdr l) k))))

(defthm theorem
    (equal (app l (app k (app l l))) (app (app l k) (app l l)))
    :rule-classes nil
)
