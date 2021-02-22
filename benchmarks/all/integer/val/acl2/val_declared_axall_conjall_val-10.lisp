(defstub f (*) => *)

(defthm theorem
    (implies
        (and
            (integerp x)
            (integerp y)
            (equal (f y) (f (+ y 1)))
        )
        (equal (f x) (f (- 10)))
    )
    :rule-classes nil
)
