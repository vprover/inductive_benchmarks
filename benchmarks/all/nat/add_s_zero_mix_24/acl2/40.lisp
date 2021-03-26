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
   (S (S (ADD (ADD (ADD (S V1) (S V4))
                   (S (ADD (S V2) V8)))
              (ADD (S (ADD (ADD (ADD V7 (S V1)) (S V6))
                           (ADD (S V0) (S V3))))
                   (ADD (S V1) (S V5))))))
   (S
    (S
     (ADD
        (ADD V1 V7)
        (ADD (S (S V2))
             (ADD (ADD (S V8) (S V6))
                  (ADD V0
                       (ADD (S V4)
                            (ADD (S (S (ADD V5 (S (S (ADD V1 (S (S V1))))))))
                                 V3)))))))))))
