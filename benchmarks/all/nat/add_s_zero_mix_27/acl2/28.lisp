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
   (ADD (S (ADD (S (S (S (ADD V7 (S V2)))))
                (S (S (S (ADD (S (S (ADD V4 (S V1))))
                              (ADD (S V0) V0)))))))
        (S (ADD (S V6)
                (ADD (S (S (S (S V3)))) V5))))
   (ADD
     (S V0)
     (ADD (S (S (S (S (ADD (ADD (ADD V2 (ADD V0 V5))
                                (ADD V1
                                     (S (S (S (S (S (S (S (S (S V4)))))))))))
                           (ADD (S (S V3)) (S (S V6))))))))
          V7)))))
