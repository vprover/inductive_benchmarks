(defstub f (*) => *)

(defthm theorem
    (implies
        (and
            (integerp x)
            (integerp y)
            (integerp z)
            (equal (f y) (f (+ y 1)))
        )
        (equal (f x) (f z))
    )
    :rule-classes nil
)
