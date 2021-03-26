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
    (ADD (S (S (ADD (S (S V0))
                    (S (ADD (S (S (ADD (ADD (S V4) V2) V5)))
                            V3)))))
         (ADD (S (ADD (ADD V8 (S V1)) (S V6)))
              (S V7)))
    (S (S (ADD V1
               (ADD (ADD (S V0) (ADD V4 V6))
                    (S (S (S (S (ADD (S V8)
                                     (S (ADD (ADD V5 (S (ADD V7 (S (S V2)))))
                                             V3))))))))))))))
