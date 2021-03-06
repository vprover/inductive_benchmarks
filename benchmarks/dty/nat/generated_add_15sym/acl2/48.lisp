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
             (= (ADD V2
                     (ADD (ADD (S V6) (S V4))
                          (S (ADD (S (ADD (S (ADD NIL (S V5))) V1))
                                  (ADD V0 (S V3))))))
                (ADD (ADD (S (S (ADD (ADD (ADD (S V5) V6)
                                          (ADD (S NIL) (S V1)))
                                     V3)))
                          V2)
                     (ADD (S V0) (S V4))))))
