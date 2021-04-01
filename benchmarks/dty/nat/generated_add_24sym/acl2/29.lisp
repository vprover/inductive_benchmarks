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
  (= (ADD (ADD V3 (S (S (S V7))))
          (ADD (ADD (ADD (ADD V3 (S V4))
                         (S (ADD (S V0) V0)))
                    (ADD (S (ADD V1 (S (S (S V6))))) V4))
               (S (ADD (S V5) (S V2)))))
     (ADD (ADD (S (S V5)) (S V1))
          (ADD (S (S (ADD (ADD (S V4) V0) (ADD V0 V7))))
               (S (S (ADD V4
                          (S (ADD V6
                                  (ADD V2
                                       (S (S (ADD (S V3) (S V3)))))))))))))))
