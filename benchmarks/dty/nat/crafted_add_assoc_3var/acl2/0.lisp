
(defun p (x) (nfix (1- x)))
(defun s (x) (1+ (nfix x)))
(defun add (x y)
    (cond ((zp x) (nfix y))
        (t (s (add (p x) y)))))

(defthm theorem
    (equal (add x (add y z)) (add (add x y) z))
    :rule-classes nil
)
