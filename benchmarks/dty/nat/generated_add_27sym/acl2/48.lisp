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
   (ADD
       (S V1)
       (ADD (S (S (ADD (S V3)
                       (S (ADD (ADD V8 (S (S V6)))
                               (S (ADD V5
                                       (ADD (S (S (S (S V4)))) (S V0)))))))))
            (S (S (ADD (S (S V7)) (S V2))))))
   (S
    (ADD
     (ADD
      (S (S (S (ADD (S (S (ADD V5 (ADD (S (S V1)) V3))))
                    (S (S (S (S (ADD (ADD (ADD (S (S (S V6))) (S (S V0))) V8)
                                     V7)))))))))
      (S V2))
     V4)))))
