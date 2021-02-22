(defstub f (*) => *)
(defstub b () => *)

(defthm theorem
    (implies
        (and
            (integerp (b))
            (integerp x)
            (integerp y)
            (implies
                (and (>= y 1) (< y (b)))
                (equal (f y) (f (+ y 1)))
            )
        )
        (implies
            (and (>= x 1) (<= x (b)))
            (equal (f x) (f 1))
        )
    )
    :rule-classes nil
)
