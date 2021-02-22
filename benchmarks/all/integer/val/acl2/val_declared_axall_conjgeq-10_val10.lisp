(defstub f (*) => *)
(defstub b () => *)

(defthm theorem
    (implies
        (and
            (integerp (b))
            (integerp x)
            (integerp y)
            (>= x (- 10))
            (equal (f y) (f (+ y 1)))
        )
        (equal (f x) (f 10))
    )
    :rule-classes nil
)
