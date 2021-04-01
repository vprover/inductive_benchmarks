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
   (S (S (ADD (S (ADD (ADD (S (ADD (ADD (ADD (S V0) V1) V8)
                                   (S (ADD (S V11) V9))))
                           (ADD (S V6) V1))
                      (ADD (ADD (ADD (S V8) (S V10))
                                (ADD (S V4) V2))
                           (ADD V3 (S V7)))))
              (S V5))))
   (S
    (ADD
     (ADD
      (S
       (S
        (ADD
         V2
         (S (S (S (ADD (ADD (ADD (ADD V1 (S (S (ADD V7 V6)))) V8)
                            (ADD (S (S (ADD V4 V1)))
                                 (S (ADD V8 (ADD V3 (ADD (S (S V9)) V10))))))
                       V11)))))))
      V5)
     V0)))))
