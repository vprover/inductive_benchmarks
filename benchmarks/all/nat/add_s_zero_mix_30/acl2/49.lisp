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
   (ADD (S (ADD (S (S V1))
                (S (S (ADD (S (ADD V3 (S (S (S V6))))) V0)))))
        (ADD (ADD (ADD V6 (S V7)) (S (S V9)))
             (S (ADD (S (ADD (S V8) (S V4)))
                     (ADD (S V2) (S (S V5)))))))
   (ADD
       (S (S (S (S V5))))
       (ADD (ADD (ADD (ADD (S V9) V7)
                      (ADD (ADD (S (S V3)) (S (ADD (S V6) V2)))
                           (S (S (S (S (ADD (ADD V0 (S (S (S V4)))) V6)))))))
                 (S (S (S V1))))
            V8)))))
