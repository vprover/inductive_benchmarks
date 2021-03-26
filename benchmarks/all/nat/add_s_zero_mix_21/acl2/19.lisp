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
   (ADD (S (ADD (S V5)
                (S (ADD (ADD (S V2) V1)
                        (ADD (S V3) ZERO)))))
        (ADD (ADD V5 (S V4))
             (ADD ZERO
                  (S (S (ADD (S V0) (S (S ZERO))))))))
   (S
    (ADD
     (ADD
         (ADD ZERO (S ZERO))
         (S (S (S (ADD (ADD (ADD (ADD V1
                                      (S (ADD (S (S (ADD (S V0) (S (S V5)))))
                                              V5)))
                                 ZERO)
                            V2)
                       V3)))))
     V4)))))
