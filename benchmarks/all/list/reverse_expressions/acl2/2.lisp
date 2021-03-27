     (DEFUN S (X0) (LIST X0))
     (DEFUN CONS_ (X0 X1) (LIST X0 X1))
     (DEFUN APP (X0 X1)
            (COND ((ENDP X0) X1)
                  ((CONSP X0)
                   (CONS_ (CAR X0)
                          (APP (CAR (CDR X0)) X1)))))
     (DEFUN REV (X0)
            (COND ((ENDP X0) X0)
                  ((CONSP X0)
                   (APP (REV (CAR (CDR X0)))
                        (CONS_ (CAR X0) NIL)))))
     (DEFTHM THEOREM
             (= (REV (APP X (APP X X)))
                (REV (APP (APP X X) X)))))