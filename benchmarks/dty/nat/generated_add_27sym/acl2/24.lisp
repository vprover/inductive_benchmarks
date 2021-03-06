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
   (ADD
    (ADD V2 (S V5))
    (S
     (ADD
      (S V5)
      (S
       (S (ADD (S (S (ADD (S (ADD (S (ADD V3 (S V7))) V6))
                          (S (S (S (S (ADD (S V6) (ADD (S V4) (S V1))))))))))
               V0))))))
   (S (ADD (ADD (ADD V5 (S (S V5)))
                (S (ADD (S V4)
                        (ADD (S (S (S (S (ADD (ADD V0 V6) (S V1))))))
                             (S (S (S (ADD (S (S (ADD (S V2) V7))) V3))))))))
           (S V6))))))
