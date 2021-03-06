(defstub f (*) => *)
(defstub b () => *)

(defthm theorem
    (implies
        (and
            (integerp (b))
            (integerp x)
            (integerp y)
            (implies
                (and (>= y (b)) (< y (- 1)))
                (equal (f y) (f (+ y 1)))
            )
        )
        (implies
            (and (>= x (b)) (<= x (- 1)))
            (equal (f x) (f (- 1)))
        )
    )
    :rule-classes nil
)
