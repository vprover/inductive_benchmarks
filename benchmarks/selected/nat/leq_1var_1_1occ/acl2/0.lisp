
(defun p (x) (nfix (1- x)))
(defun leq (x y)
    (or (zp x) (and (not (zp y)) (leq (p x) (p y)))))

(defthm theorem
    (leq x x)
    :rule-classes nil
)
