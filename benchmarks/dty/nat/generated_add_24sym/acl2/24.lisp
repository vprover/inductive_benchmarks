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
     (S (S (S (ADD (ADD (S V3) V7)
                   (S (ADD (ADD V5 (S V1))
                           (ADD (S (S (ADD (S V2) (ADD (ADD (S V4) V6) V0))))
                                (S (S (S V0))))))))))
     (S V7))
   (ADD (ADD (ADD V6 (ADD (S (S (ADD V0 V3))) V4))
             (S (ADD (S (S (S (S (ADD V1 (ADD (S (S (S V5))) (S (S V7))))))))
                     (ADD (S V2) V7))))
        (S V0)))))
