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
   (S (ADD (ADD (S (S (ADD (S V6)
                           (ADD (ADD (S V0) V5) (S V7)))))
                (ADD (ADD (S (ADD (S V3) V2)) (S V7))
                     V4))
           (ADD V6 (S (S V1)))))
   (S
    (S (ADD (ADD V6
                 (S (ADD V0
                         (ADD (ADD V7 (S (S (ADD V3 V2))))
                              (S (S (ADD (ADD (ADD V7 (S (S (S V4)))) (S V5))
                                         V1)))))))
            V6))))))
