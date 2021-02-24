(defstub f (*) => *)
(defstub a () => *)
(defstub b () => *)

(defthm theorem
    (implies
        (and
            (integerp (a))
            (integerp (b))
            (integerp x)
            (integerp y)
            (implies
                (and (>= y a) (< y b))
                (equal (f y) (f (+ y 1)))
            )
        )
        (implies
            (and (>= x a) (<= x b))
            (equal (f x) (f (a)))
        )
    )
    :rule-classes nil
)
