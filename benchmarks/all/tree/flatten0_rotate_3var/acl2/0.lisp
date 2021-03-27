     (DEFUN S (X0) (LIST X0))
     (DEFUN CONS_ (X0 X1) (LIST X0 X1))
     (DEFUN NODE (X0 X1 X2) (LIST X0 X1 X2))
     (DEFUN APP (X0 X1)
            (COND ((ENDP X0) X1)
                  ((CONSP X0)
                   (CONS_ (CAR X0)
                          (APP (CAR (CDR X0)) X1)))))
     (DEFUN FLATTEN0 (X0)
            (COND ((ENDP X0) X0)
                  ((CONSP X0)
                   (APP (FLATTEN0 (CAR X0))
                        (CONS_ (CAR (CDR X0))
                               (FLATTEN0 (CAR (CDR (CDR X0)))))))))
     (DEFTHM THEOREM
             (= (FLATTEN0 (NODE (NODE P X P) Y P))
                (FLATTEN0 (NODE P X (NODE P Y P))))))
