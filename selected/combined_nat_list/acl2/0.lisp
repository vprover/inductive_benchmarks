
(defun p (x) (nfix (1- x)))
(defun s (x) (1+ (nfix x)))
(defun add (x y)
    (cond ((zp x) (nfix y))
        (t (s (add (p x) y)))))

(defun app (l k)
  (if (endp l) k
        (cons (car l)
            (app (cdr l) k))))

(defthm theorem
    (equal
        (app (cons (add x (s x)) l) (app l l))
        (app (app (cons (add (s x) x) l) l) l))
    :rule-classes nil
)
