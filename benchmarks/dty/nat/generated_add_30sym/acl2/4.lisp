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
   (S
    (ADD
       (S (ADD (S V3) (S (S (S V0)))))
       (S (S (ADD (S (ADD V4
                          (S (ADD (S V1)
                                  (S (S (S (S (ADD (S (S V6)) (S V2))))))))))
                  (ADD (ADD (S NIL) (S V2)) (S V5)))))))
   (ADD
     (ADD (S (S (S (ADD V0
                        (ADD (S (S (S (ADD (S (S (S V4))) (S V6)))))
                             (S (ADD (S (ADD (ADD (S (S V2)) (S V1)) (S V3)))
                                     (S NIL))))))))
          (S (S (S (S V2)))))
     V5))))
