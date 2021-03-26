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
   (ADD (ADD (ADD V7 (S V4))
             (ADD (ADD (ADD (S (S V3)) (S (ADD (S V0) V1)))
                       (ADD V9 (S V1)))
                  (S (ADD (S V1) (ADD (S V5) (S V6))))))
        (S (S (S (S (ADD (S V8) V2))))))
   (S
    (S (ADD (ADD (ADD (S V1)
                      (ADD (S (S (ADD (S V2) (S (ADD V4 (S V1))))))
                           (S V6)))
                 (S (S (S (ADD (ADD (S (S (ADD (S (ADD V8 (ADD V7 V0))) V9)))
                                    V3)
                               V5)))))
            V1))))))
