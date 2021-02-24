(defstub b () => *)

(defaxiom b-ax (integerp (b)))

(defun f (x)
    (declare (xargs :guard (integerp x)))
    (if (not (and (integerp x) (< x (b))))
        0
        (f (+ x 1))
    )
)

(defthm theorem
    (implies
        (and
           (integerp x)
           (<= x (b))
        )
        (equal (f x) (f (b)))
    )
    :rule-classes nil
)
