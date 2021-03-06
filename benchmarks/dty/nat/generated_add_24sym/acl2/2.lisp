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
        (= (S (ADD (ADD (S (ADD (S V3)
                                (ADD (ADD (S V4) (ADD (S V6) V1))
                                     (ADD (S (ADD V0 (S V3)))
                                          (ADD (S NIL) V4)))))
                        (ADD (S NIL) NIL))
                   (ADD (S V5) (S (S V2)))))
           (ADD (ADD NIL
                     (S (ADD (ADD (S (ADD V4 V6)) (S (S (S V1))))
                             (ADD (ADD NIL V5) V4))))
                (ADD (S (S (ADD V3
                                (S (S (ADD (S NIL) (S (ADD (S V2) V3))))))))
                     V0)))))
