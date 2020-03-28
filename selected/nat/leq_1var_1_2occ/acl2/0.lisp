
(defun p (x) (nfix (1- x)))
(defun s (x) (1+ (nfix x)))
(defun add (x y)
    (cond ((zp x) (nfix y))
        (t (s (add (p x) y)))))
(defun leq (x y)
    (or (zp x) (and (not (zp y)) (leq (p x) (p y)))))

(defthm theorem
    (leq x (add x x))
    :rule-classes nil
)
