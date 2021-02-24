(defstub f (*) => *)

(defthm theorem
    (implies
        (and
            (integerp x)
            (integerp y)
            (>= x 10)
            (>= y 3)
            (equal (f y) (f (+ y 1)))
        )
        (equal (f x) (f 100))
    )
    :rule-classes nil
)

