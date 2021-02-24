
(defun sumY (x y)
    (declare (xargs :guard (and (integerp x) (integerp y) (<= x y))))
    (cond
        ((not (and (integerp x) (integerp y) (<= x y))) 0)
        ((= x y) x)
        (t (+ y (sumY x (- y 1))))
    )
)

(defthm theorem
    (implies
        (and
            (integerp y)
            (<= 16 y)
        )
        (equal (* 2 (sumY 0 y)) (* y (+ y 1)))
    )
    :rule-classes nil
)
