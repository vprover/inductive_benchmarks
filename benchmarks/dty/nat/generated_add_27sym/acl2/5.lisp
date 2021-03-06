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
      (= (ADD (S (S (S (S (S (S (S (ADD (S (S (S (S (ADD (S V0) (S V1))))))
                                        (S (ADD (S (ADD V5 (S (S V4))))
                                                (S (ADD V0 (S V2)))))))))))))
              (S V3))
         (ADD (S (S (S V0)))
              (ADD (S (ADD (S (S (S V4)))
                           (ADD (S (S (S (S V0)))) (S V1))))
                   (ADD (ADD (S (S (S (S (S (S (S V3))))))) V2)
                        (S V5)))))))
