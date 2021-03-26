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
   (S (ADD (S (ADD (ADD (S (S V6)) V4)
                   (ADD (ADD (S V8) (ADD V0 (S V1))) V2)))
           (S (S (ADD (S (S (ADD (S V5) (S (S (S V3))))))
                      (S (ADD (S V7) (S V9))))))))
   (S
    (ADD
       (S (S (ADD (ADD (S (ADD (S (S (S V7)))
                               (S (S (S (S (ADD (ADD V3 (S V8)) (S V4))))))))
                       (S (ADD (ADD V6 (S (S V5))) (ADD V0 V1))))
                  V2)))
       (S V9))))))
