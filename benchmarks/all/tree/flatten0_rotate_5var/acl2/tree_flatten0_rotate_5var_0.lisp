
(defun app (l k)
    (if (endp l) k
        (cons (car l) (app (cdr l) k))))

(defun node (lc v rc) (list lc v rc))
(defun nodep (n) (and (consp n) (consp (cdr n))))

(defun lc (n) (first n))
(defun rc (n) (third n))
(defun val (n) (second n))

(defun flatten0 (tr)
    (cond ((null tr) nil)
        ((nodep tr)
            (app (flatten0 (lc tr)) (cons (val tr) (flatten0 (rc tr)))))))

(defthm rotate
    (equal (flatten0 (node (node p x q) y r))
        (flatten0 (node p x (node q y r))))
)
