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
   (S (ADD (S (S (ADD (S V0) V6)))
           (S (S (ADD (S V5)
                      (ADD (S (S (ADD (S V3) V7)))
                           (S (S (S (S (ADD (ADD (S (S V4)) (S V2))
                                            (ADD (S V1) V8))))))))))))
   (ADD
    (S (ADD V2 (S (S (S V3)))))
    (ADD
     (S
      (S
        (S (S (ADD (S (S (ADD (S (S (ADD (S (ADD (S V5) (S (ADD V4 (S V0)))))
                                         (S V7))))
                              (S V1))))
                   V6)))))
     V8)))))
