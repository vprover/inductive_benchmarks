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
   (S (ADD (ADD (S (S (S (S V2))))
                (ADD (S (S (ADD V4 (S V3))))
                     (ADD (S (S (S V4)))
                          (ADD V7
                               (ADD (S (S (ADD (S V0) (S V6)))) V1)))))
           (S (ADD V8 (S V5)))))
   (S
    (ADD
     V1
     (S
      (ADD
       (S V3)
       (S
        (S
         (ADD
           (ADD (ADD (S (S (S (S (ADD V6
                                      (S (ADD (S (ADD (S (S (S (S V0)))) V8))
                                              V4)))))))
                     (S V5))
                (S (ADD V2 V4)))
           V7))))))))))
