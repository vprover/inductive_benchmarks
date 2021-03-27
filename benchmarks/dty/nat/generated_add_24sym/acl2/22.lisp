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
   (S (S (S (ADD (S (S (ADD (S V6)
                            (ADD (ADD (ADD (S V8) V4) V7)
                                 (S (ADD (S V3) (S (ADD V5 (S V2)))))))))
                 (S (ADD (ADD V0 (S V5)) (S V1)))))))
   (ADD
    (S
      (ADD (S (ADD (S V4)
                   (S (ADD (ADD V7 V8)
                           (ADD (ADD V1
                                     (S (S (ADD (S (S (S V5))) (S (S V2))))))
                                (S (S (ADD (S V6) V0))))))))
           V5))
    V3))))
