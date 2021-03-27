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
   (S (S (S (ADD (S (ADD (ADD (ADD (ADD (S V1) V8) (S V5))
                              (ADD (S V4) V7))
                         (ADD (ADD (S V3) V2)
                              (S (ADD V8 (ADD V0 (S V7)))))))
                 (S (S (ADD (S V5) (S (S V6)))))))))
   (S
    (S
     (S
      (S
        (ADD (S (S (ADD (S V5)
                        (ADD (S (ADD (S (ADD (S V8) V3))
                                     (S (S (ADD (S (ADD V0 V6))
                                                (ADD (S V4) (ADD V1 V7)))))))
                             (ADD (ADD V2 (S V8)) V7)))))
             V5))))))))
