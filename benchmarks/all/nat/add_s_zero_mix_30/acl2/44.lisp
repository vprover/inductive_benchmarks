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
   (ADD (ADD (S (ADD (ADD (S V6) (S (S (S V5))))
                     (ADD (ADD (S ZERO) (S V0))
                          (ADD V3 (S (S (S V4)))))))
             (S (ADD (ADD (S (S V7)) (S V2))
                     (ADD V7 (S V0)))))
        (S (ADD (S V8) (S V1))))
   (ADD (ADD (S (S V7))
             (S (S (S (ADD (S (ADD V8
                                   (S (ADD (ADD V5 (ADD V0 (ADD V7 V2)))
                                           V1))))
                           (S (S (S (ADD V3
                                         (ADD (S (ADD (S (S (S V4))) (S V0)))
                                              (S (S V6))))))))))))
        (S ZERO)))))
