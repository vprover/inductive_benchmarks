
(defun app (l k)
    (if (endp l) k
        (cons (car l) (app (cdr l) k))))

(defun node (lc v rc) (list lc v rc))
(defun leaf (v) (node nil v nil))
(defun nodep (n) (and (consp n) (consp (cdr n))))

(defun lc (n) (first n))
(defun rc (n) (third n))
(defun val (n) (second n))

(defun flatten0 (tr)
    (cond ((null tr) nil)
        ((nodep tr)
            (app (flatten0 (lc tr)) (cons (val tr) (flatten0 (rc tr)))))))

(defun flatten2 (tr lst)
    (cond ((null tr) lst)
        ((nodep tr)
            (flatten2 (lc tr) (cons (val tr) (flatten2 (rc tr) lst))))))

(defthm theorem
    (equal (app (flatten0 (node p x q)) l)
        (flatten2 (node p x q) l))
)
