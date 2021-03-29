 (DEFUN S (X0) (LIST X0))
 (DEFUN CONS_ (X0 X1) (LIST X0 X1))
 (DEFUN ADD (X0 X1)
        (COND ((ENDP X0) X1)
              ((CONSP X0) (S (ADD (CAR X0) X1)))))
 (DEFUN MUL (X0 X1)
        (COND ((ENDP X0) X0)
              ((CONSP X0)
               (ADD X1 (MUL (CAR X0) X1)))))
 (DEFUN LEQ (X0 X1)
        (COND ((ENDP X0) T)
              ((AND (CONSP X0) (ENDP X1)) (NOT T))
              ((AND (CONSP X0) (CONSP X1))
               (LEQ (CAR X0) (CAR X1)))))
 (DEFUN LESS (X0 X1) (LEQ (S X0) X1))
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
 (DEFUN _LEN (X0)
        (COND ((ENDP X0) NIL)
              ((CONSP X0) (S (_LEN (CAR (CDR X0)))))))
 (DEFUN _GET (X0 X1)
        (COND ((AND (CONSP X0) (ENDP X1)) (CAR X0))
              ((AND (CONSP X0) (CONSP X1))
               (_GET (CAR (CDR X0)) (CAR X1)))
              ((ENDP X0) (OUTOFBOUNDS X1))))
 (DEFUN CNT (X0 X1)
        (COND ((ENDP X0) NIL)
              ((CONSP X0) (COND
                  ((= (CAR X0) X1) (S (CNT (CAR (CDR X0)) X1)))
                  (T (CNT (CAR (CDR X0)) X1))))))
 (DEFUN REV (X0)
        (COND ((CONSP X0)
               (APP (REV (CAR (CDR X0)))
                    (CONS_ (CAR X0) NIL)))
              ((ENDP X0) X0)))
 (DEFTHM THEOREM (= (_LEN
 (REV X)) (_LEN
 X)))