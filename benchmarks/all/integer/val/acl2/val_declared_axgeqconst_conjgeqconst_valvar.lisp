(defstub f (*) => *)
(defstub b () => *)

(defthm theorem
    (implies
        (and
            (integerp (b))
            (integerp x)
            (integerp y)
            (integerp z)
            (>= x (b))
            (>= y (b))
            (>= x (b))
            (equal (f y) (f (+ y 1)))
        )
        (equal (f x) (f z))
    )
    :rule-classes nil
)
