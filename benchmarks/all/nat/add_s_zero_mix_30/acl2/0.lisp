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
   (ADD (S (S (S V7)))
        (ADD (ADD V6 (S (S (ADD (S V4) (S V5)))))
             (ADD (S V8)
                  (S (S (ADD (ADD (ADD V3 (ADD (S V7) V1))
                                  (S (S ZERO)))
                             (S (S (ADD V9 (S (ADD (S V2) (S V0))))))))))))
   (ADD
      (ADD (ADD (S (S (ADD (ADD V4 (ADD (ADD (S V7) V1) V7))
                           (S (S (S (S (S (ADD (S V8) (S (S (S V9))))))))))))
                V0)
           V2)
      (ADD (S V5)
           (ADD (S (S (ADD ZERO (S (S (S V3))))))
                V6))))))