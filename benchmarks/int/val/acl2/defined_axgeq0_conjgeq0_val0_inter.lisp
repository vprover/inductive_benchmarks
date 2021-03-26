(defun f (x)
    (declare (xargs :guard (integerp x)))
    (if (not (and (integerp x) (> x 0)))
        0
        (f (- x 1))
    )
)

(defthm theorem
    (implies
        (and
           (integerp x)
           (>= x 0)
        )
        (equal (f x) (f 0))
    )
    :rule-classes nil
)
