(defstub b () => *)

(defaxiom b-ax (integerp (b)))

(defun f (x)
    (declare (xargs :guard (integerp x)))
    (cond
        ((or (not (integerp x)) (= x (b))) 0)
        ((> x (b)) (f (- x 1)))
        (t (f (+ x 1)))
    )
)

(defthm theorem
    (implies
        (integerp x)
        (equal (f x) (f (b)))
    )
    :rule-classes nil
)
