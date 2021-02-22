(defun power (x e)
    (declare (xargs :guard (and (integerp x) (integerp e) (>= e 0))))
    (cond
        ((not (and (integerp x) (integerp e) (>= e 0))) 0)
        ((= e 0) 1)
        (t (* x (power x (- e 1))))
    )
)

(defthm theorem
    (implies
        (and
           (integerp x)
           (integerp y)
           (integerp e)
           (>= e 0)
           (>= x 0)
           (>= y 0)
        )
        (= (power (* x y) e) (* (power x e) (power y e)))
    )
    :rule-classes nil
)
