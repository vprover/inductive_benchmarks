(defstub f (*) => *)
(defstub b1 () => *)
(defstub b2 () => *)

(defthm theorem
    (implies
        (and
            (integerp (b1))
            (integerp (b2))
            (integerp x)
            (integerp y)
            (implies
                (and (>= y b1) (< y b2))
                (equal (f y) (f (+ y 1)))
            )
        )
        (implies
            (and (>= x b1) (<= x b2))
            (equal (f x) (f (b2)))
        )
    )
    :rule-classes nil
)
