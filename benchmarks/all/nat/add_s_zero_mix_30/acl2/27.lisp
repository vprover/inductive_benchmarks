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
   (ADD (S (S V3))
        (ADD (ADD (ADD (S V0) (ADD (S V9) V4))
                  (ADD (ADD (S V11) (S V1))
                       (S (ADD V2 (S V9)))))
             (S (S (ADD (ADD (ADD V7 (S V8))
                             (S (ADD V2 (S (S (S V5))))))
                        (ADD (S V10) V6))))))
   (S
    (ADD (S (S (ADD (ADD V11 (ADD V0 (S (S V3))))
                    (ADD (S (ADD V7
                                 (ADD V5 (S (ADD (ADD V2 V10) (S (S V9)))))))
                         V9))))
         (S (ADD (S (ADD (S V1) (ADD V2 (S V8))))
                 (S (ADD V6 (S (S V4)))))))))))
