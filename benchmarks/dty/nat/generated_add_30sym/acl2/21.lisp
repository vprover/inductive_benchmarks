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
  (= (ADD (ADD (ADD (S (S (S (S (S (S (ADD (S (S (ADD (S V4) (S V9))))
                                           (S V7))))))))
                    (S (ADD V1 (S V5))))
               (S (ADD V8 (S (S (S V6))))))
          (S (ADD (S V0) (ADD V2 (S V3)))))
     (S (ADD (ADD (ADD (S (ADD (S (ADD (S (S V7)) V2))
                               (ADD (S (S V5)) (S (S (S V8))))))
                       (S V9))
                  (S (S (ADD (S (S (S (ADD (S (S V0)) (S (ADD V3 (S V6)))))))
                             V1))))
             V4)))))
