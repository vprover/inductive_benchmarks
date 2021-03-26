     (DEFUN S (X0) (LIST X0))
     (DEFUN ADD (X0 X1)
            (COND ((ENDP X0) X1)
                  ((CONSP X0) (S (ADD (CAR X0) X1)))))
     (DEFUN LEQ (X0 X1)
            (COND ((ENDP X0) T)
                  ((AND (CONSP X0) (ENDP X1)) NIL)
                  ((AND (CONSP X0) (CONSP X1))
                   (LEQ (CAR X0) (CAR X1)))))
     (DEFTHM THEOREM
             (= (ADD (ADD (S (S (ADD (S (S V4)) (S V1))))
                          (S (ADD V0 (S V3))))
                     V2)
                (S (S (ADD (ADD (S (ADD (S V3) (S V2))) V4)
                           (S (ADD (S V0) V1))))))))
