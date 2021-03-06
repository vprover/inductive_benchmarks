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
    (ADD (S (ADD (S (ADD (S V3) (S (S V4))))
                 (S (ADD V2 (S (S (S V1)))))))
         (ADD (S (ADD (ADD V5 (S V0))
                      (S (ADD V1 (S V6)))))
              (S (S V4))))
    (S (S (S (ADD (S (S (ADD (ADD (S V1) V0)
                             (S (ADD V3
                                     (ADD (S (S (ADD (S (S (S V4))) (S V6))))
                                          V2))))))
                  (ADD V4 (S (ADD V1 (S V5)))))))))))
