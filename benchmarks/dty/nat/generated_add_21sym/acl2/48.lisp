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
     (= (S (ADD (ADD (ADD (ADD (S (ADD V3 (S (S V4))))
                               (ADD (ADD (ADD V0 (S V2)) (ADD (S V9) V8))
                                    (S V6)))
                          (ADD V5 (S V8)))
                     (S V7))
                (S V1)))
        (ADD (S V9)
             (S (ADD (ADD V1 V4)
                     (ADD V8
                          (S (S (S (ADD (ADD V3 V8)
                                        (ADD V7
                                             (ADD (S (S V5))
                                                  (S (ADD (ADD V0 (S (S V6)))
                                                          V2)))))))))))))))