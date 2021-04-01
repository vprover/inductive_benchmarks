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
   (S (ADD (ADD V5
                (ADD (ADD (S V0) V3)
                     (S (ADD (ADD (S (S V6))
                                  (S (S (S (ADD V7 (S V1))))))
                             (S (S (S V2)))))))
           (S (S (S (ADD (S V2) (S (S V4))))))))
   (S
    (S
     (S
      (S
       (S
        (ADD
          (S (S (S (S V7))))
          (ADD (ADD V1 V6)
               (S (S (S (ADD (S (ADD (ADD (S (ADD (S (S (S V3))) V2)) (S V0))
                                     V4))
                             (ADD V5 V2)))))))))))))))
