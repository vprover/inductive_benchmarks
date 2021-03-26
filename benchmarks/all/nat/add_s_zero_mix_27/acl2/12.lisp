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
   (S
    (S (S (ADD (S (S (S (ADD (ADD (ADD (S V9) V8)
                                  (ADD (S V3)
                                       (ADD (S V4) (S (S (ADD V5 (S V7)))))))
                             (ADD (ADD (S V6) V2) V0)))))
               (S (S (ADD (S V1) V8)))))))
   (ADD (S (S (ADD (ADD (ADD (S (S (S V4))) (S (S V8))) V7)
                   V0)))
        (ADD (S (S (ADD (ADD V5 V3)
                        (ADD V2 (ADD V6 (S (S V1)))))))
             (S (ADD V8 (S (S (S (S V9)))))))))))
