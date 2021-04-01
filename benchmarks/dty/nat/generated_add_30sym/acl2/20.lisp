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
    (ADD (S V1) V4)
    (S (S (ADD (S (ADD (S (S V2)) V7))
               (S (S (ADD (S (S (ADD (S (S (S (ADD V6 (S (ADD (S V0) V5))))))
                                     (S (S (S (ADD (S V3) V6)))))))
                          (S V8))))))))
   (S (ADD (ADD (S V6)
                (S (S (ADD (S (S (ADD (ADD (S (S (S (S (S V0))))) (S V5))
                                      (ADD V2 V7))))
                           (S (S (ADD (ADD (S (S V1)) V6)
                                      (ADD (S (S V8)) (S (S V3))))))))))
           V4)))))
