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
            (integerp y)
            (<= x y)
        )
        (equal (* 2 (sumX x y)) (- (* y (+ y 1)) (* x (- x 1))))
    )
    :rule-classes nil
)
