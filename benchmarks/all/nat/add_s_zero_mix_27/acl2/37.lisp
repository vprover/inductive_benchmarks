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
    (S
      (S (ADD (ADD (S V5) V8)
              (ADD (S V6)
                   (ADD (S (ADD (S V0) V1))
                        (S (ADD (ADD V4 (S ZERO))
                                (S (S (S (S (ADD (ADD (ADD (S V2) V3) (S V1))
                                                 (S V7))))))))))))))
   (S (S (S (ADD (S (ADD (S (ADD (S (ADD (S (S (S (S V0)))) V1))
                                 (S (S (S (S V2))))))
                         (S (ADD (ADD (S V1) (ADD V3 ZERO))
                                 (ADD (ADD V8 (ADD V6 V4)) V5)))))
                 V7)))))))
