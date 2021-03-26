     (DEFUN CONS_ (X0 X1) (LIST X0 X1))
(DEFUN S (X0) (LIST X0))
     (DEFUN APP (X0 X1)
            (COND ((ENDP X0) X1)
                  ((CONSP X0)
                   (CONS_ (CAR X0)
                          (APP (CAR (CDR X0)) X1)))))
     (DEFUN PREF (X0 X1)
            (COND ((ENDP X0) T)
                  ((AND (CONSP X0) (ENDP X1)) NIL)
                  ((AND (CONSP X0) (CONSP X1))
                   (AND (= (CAR X0) (CAR X1))
                        (PREF (CAR (CDR X0)) (CAR (CDR X1)))))))
     (DEFTHM THEOREM
             (PREF (APP V0 (APP V0 (APP V0 (APP V0 V0))))
                   (APP V0
                        (APP V0
                             (APP (APP V0 V0)
                                  (APP (APP V0 V0) V0)))))))
