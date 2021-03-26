(defun f (x)
    (declare (xargs :guard (integerp x)))
    (if (not (and (integerp x) (< x 3)))
        0
        (f (+ x 1))
    )
)

(defthm theorem
    (implies
        (and
           (integerp x)
           (<= x 3)
        )
        (equal (f x) (f 3))
    )
    :rule-classes nil
)
