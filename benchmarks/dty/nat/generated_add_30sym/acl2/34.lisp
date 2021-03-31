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
   (= (ADD (ADD (S (S V7)) (ADD (S V8) V6))
           (ADD (ADD (S (ADD (ADD V1 (S V0)) (S (S V4))))
                     (S V1))
                (ADD (S (S (S (S (S (ADD (ADD NIL (S V9)) (S (S V2))))))))
                     (ADD (S V3) (S V5)))))
      (ADD (ADD (S (ADD (ADD (ADD (ADD (S (S V4)) (S NIL)) V0)
                             V7)
                        (S (S V6))))
                (S (ADD (S V1)
                        (S (S (S (S (ADD (ADD (ADD (S (S V9)) (S V1)) (S V8))
                                         (ADD (S V3) (S V5))))))))))
           V2))))
