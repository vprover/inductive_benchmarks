
(defun sumX (x y)
    (declare (xargs :guard (and (integerp x) (integerp y) (<= x y))))
    (cond
        ((not (and (integerp x) (integerp y) (<= x y))) 0)
        ((= x y) x)
        (t (+ x (sumX (+ x 1) y)))
    )
)

(defthm theorem
    (implies
        (and
            (integerp x)
            (<= x (- 1))
        )
        (equal (* 2 (sumX x 0)) (- (* x (- x 1))))
    )
    :rule-classes nil
)
