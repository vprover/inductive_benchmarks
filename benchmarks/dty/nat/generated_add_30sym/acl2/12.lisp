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
   (ADD (S (S (ADD (S (S (S V0))) V7)))
        (S (ADD (S (S (ADD (S (S V1)) V4)))
                (ADD (ADD (ADD V10 (S NIL))
                          (S (ADD V6 (S (ADD (S (ADD (S V8) V5)) V9)))))
                     (ADD (S V2) (ADD (S V5) V3))))))
   (ADD
    (ADD V4 V10)
    (ADD
        (S V5)
        (S (ADD (S (ADD (S V8)
                        (S (ADD (ADD (ADD (ADD (S (S (S V7))) V6) (S (S V2)))
                                     V0)
                                V9))))
                (S (ADD NIL
                        (ADD (S V1)
                             (S (S (ADD V3 (S (S (S V5))))))))))))))))
