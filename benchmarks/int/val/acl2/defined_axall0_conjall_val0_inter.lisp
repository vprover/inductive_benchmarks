(defun f (x)
    (declare (xargs :guard (integerp x)))
    (cond
        ((zip x) 0)
        ((> x 0) (f (- x 1)))
        (t (f (+ x 1)))
    )
)

(defthm theorem
    (implies
        (integerp x)
        (equal (f x) (f 0))
    )
    :rule-classes nil
)
