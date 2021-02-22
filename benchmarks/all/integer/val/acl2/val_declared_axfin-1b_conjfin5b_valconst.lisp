(defstub f (*) => *)
(defstub b () => *)

(defthm theorem
    (implies
        (and
            (integerp (b))
            (integerp x)
            (integerp y)
            (implies
                (and (>= y (- 1)) (< y (b)))
                (equal (f y) (f (+ y 1)))
            )
        )
        (implies
            (and (>= x 5) (<= x (b)))
            (equal (f x) (f (b)))
        )
    )
    :rule-classes nil
)
