(defstub f (*) => *)

(defthm theorem
    (implies
        (and
            (integerp x)
            (integerp y)
            (<= x 3)
            (<= y 10)
            (equal (f y) (f (+ y 1)))
        )
        (equal (f x) (f 0))
    )
    :rule-classes nil
)

