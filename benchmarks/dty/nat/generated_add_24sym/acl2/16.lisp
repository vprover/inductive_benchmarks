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
   (S (ADD V1
           (S (ADD (ADD (ADD (S V9) V3)
                        (ADD (S (ADD (S (S (ADD (S V4) (S V8))))
                                     (S V7)))
                             (ADD V0 (S (ADD V2 (S (ADD (S V6) V5)))))))
                   (S V8)))))
   (S
    (ADD V1
         (S (ADD (S (ADD (ADD (S (S V6)) (S V9)) V3))
                 (ADD (ADD (ADD (ADD V7 (ADD (S V2) (ADD (S V4) (S (S V8)))))
                                (S (S V5)))
                           V8)
                      (S V0)))))))))
