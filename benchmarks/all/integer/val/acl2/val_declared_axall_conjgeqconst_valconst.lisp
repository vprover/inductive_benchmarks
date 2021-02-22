(defstub f (*) => *)
(defstub b () => *)

(defthm theorem
    (implies
        (and
            (integerp (b))
            (integerp x)
            (integerp y)
            (>= x (b))
            (equal (f y) (f (+ y 1)))
        )
        (equal (f x) (f (b)))
    )
    :rule-classes nil
)
