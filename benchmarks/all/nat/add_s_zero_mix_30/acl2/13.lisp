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
        (= (ADD (ADD (S V5) (ADD (S V3) (S (S (S V1)))))
                (ADD (S (S (S (S (S (ADD (S (ADD (ADD (S V6) (S V8)) (S V2)))
                                         V4))))))
                     (S (ADD (S (S V0))
                             (S (S (ADD V7 (S V5))))))))
           (ADD (ADD (ADD (S V4) V6) V3)
                (ADD (S (S (S (ADD (S (S (S (ADD V8 (S (S V5))))))
                                   V2))))
                     (S (ADD V1
                             (S (ADD (S (ADD (S (S (S (S V7)))) (S (S V0))))
                                     (S (S V5)))))))))))
