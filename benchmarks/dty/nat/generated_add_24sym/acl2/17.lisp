 (DEFUN S (X0) (LIST X0))
 (DEFUN ADD (X0 X1)
        (COND ((ENDP X0) X1)
              ((CONSP X0) (S (ADD (CAR X0) X1)))))
 (DEFUN LEQ (X0 X1)
        (COND ((ENDP X0) T)
              ((AND (CONSP X0) (ENDP X1)) NIL)
              ((AND (CONSP X0) (CONSP X1))
               (LEQ (CAR X0) (CAR X1)))))
 (DEFTHM
  THEOREM
  (=
   (ADD (S (S (S (ADD (S (ADD (ADD (ADD (S V6) (ADD (S V3) V4))
                                   (ADD V5 (S V1)))
                              (S (ADD (S V5) V8))))
                      (S (S (S (ADD (S V7) V0))))))))
        (S V2))
   (S
    (S
     (ADD
        (ADD (S (S (ADD (S (S (S (ADD V2 (S (ADD (S V4) (ADD V3 (S V5))))))))
                        (S (ADD V6 (ADD V0 (ADD V1 (S (S V5)))))))))
             (S V8))
        V7))))))
