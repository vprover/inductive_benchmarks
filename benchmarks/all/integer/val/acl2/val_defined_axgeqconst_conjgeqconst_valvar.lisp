(defstub b () => *)

(defaxiom b-ax (integerp (b)))

(defun f (x)
    (declare (xargs :guard (integerp x)))
    (if (not (and (integerp x) (> x (b))))
        0
        (f (- x 1))
    )
)

(defthm theorem
    (implies
        (and
           (integerp x)
           (integerp y)
           (>= x (b))
           (>= y (b))
        )
        (equal (f x) (f y))
    )
    :rule-classes nil
)
