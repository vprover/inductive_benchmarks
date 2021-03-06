(defstub f (*) => *)

(defthm theorem
    (implies
        (and
            (integerp x)
            (integerp y)
            (<= x 10)
            (<= y 100)
            (equal (f y) (f (+ y 1)))
        )
        (equal (f x) (f 3))
    )
    :rule-classes nil
)

