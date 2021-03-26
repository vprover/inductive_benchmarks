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
   (ADD (ADD (ADD (ADD (S (S V9)) (S V7))
                  (ADD (S V2) V4))
             (ADD (S V1) (S V3)))
        (ADD (S (ADD (S (S (S V0)))
                     (S (S (S (S (S (S V5))))))))
             (ADD V6 (S V8))))
   (S
    (S
      (ADD V2
           (ADD V3
                (S (ADD (S (S (S (ADD (S V4) (S (S V6))))))
                        (ADD (ADD (S (S (S (S V9)))) (S V8))
                             (ADD V0
                                  (S (ADD (S (ADD V1 (S V7))) V5)))))))))))))
