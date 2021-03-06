(defstub f (*) => *)

(defthm theorem
    (implies
        (and
            (integerp x)
            (integerp y)
            (>= x 0)
            (>= y 0)
            (equal (f y) (f (+ y 1)))
        )
        (equal (f x) (f 0))
    )
    :rule-classes nil
)

