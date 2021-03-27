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
   (S (ADD (ADD (S (S V7)) (S V1))
           (S (ADD (S (S (S (S (ADD (S (S (S V5))) V3)))))
                   (ADD (S (S V0))
                        (S (ADD (ADD (ADD (S V3) V8) (S V4))
                                (ADD (S (S V2)) (S V6)))))))))
   (ADD
    (S V3)
    (S
      (ADD (ADD (ADD (S (S (ADD (ADD (ADD (S (S V0)) (ADD (S V7) (S (S V1))))
                                     (S V6))
                                (S (S (S (S V2)))))))
                     (S (ADD (S V4) V8)))
                (S (S (S (S V3)))))
           V5))))))
