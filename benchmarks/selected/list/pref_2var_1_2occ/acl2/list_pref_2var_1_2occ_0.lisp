
(defun app (l k)
  (if (endp l) k
        (cons (car l)
            (app (cdr l) k))))

(defun prefix (l k)
  (or (endp l)
    (and (not (endp k))
         (equal (car l) (car k))
         (prefix (cdr l) (cdr k)))))

(defthm theorem
    (prefix l (app l k))
    :rule-classes nil
)
