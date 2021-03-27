     (DEFUN S (X0) (LIST X0))
     (DEFUN CONS_ (X0 X1) (LIST X0 X1))
     (DEFUN ADD (X0 X1)
            (COND ((ENDP X0) X1)
                  ((CONSP X0) (S (ADD (CAR X0) X1)))))
     (DEFUN APP (X0 X1)
            (COND ((ENDP X0) X1)
                  ((CONSP X0)
                   (CONS_ (CAR X0)
                          (APP (CAR (CDR X0)) X1)))))
     (DEFTHM THEOREM
             (= (APP (CONS_ (ADD N (S N)) X) (APP X X))
                (APP (APP (CONS_ (ADD (S N) N) X) X)
                     X))))