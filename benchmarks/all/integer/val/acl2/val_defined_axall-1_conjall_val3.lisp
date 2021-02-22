(defun f (x)
    (declare (xargs :guard (integerp x)))
    (cond
        ((or (not (integerp x)) (= x (- 1))) 0)
        ((> x (- 1)) (f (- x 1)))
        (t (f (+ x 1)))
    )
)

(defthm theorem
    (implies
        (integerp x)
        (equal (f x) (f 3))
    )
    :rule-classes nil
)
