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
      (= (ADD (S (ADD ZERO
                      (ADD (S V7)
                           (ADD (S (ADD V2 (S V6)))
                                (ADD V0 (S ZERO))))))
              (S (ADD (ADD (S V1)
                           (ADD (S (S (S (S (ADD (S V8) V9)))))
                                (S (ADD V3 (S (S (S (S V5))))))))
                      (S V4))))
         (S (S (S (ADD (ADD (S (ADD (S V1)
                                    (S (ADD V8
                                            (S (ADD (S (S (S V3)))
                                                    (S (ADD V9 (S V7)))))))))
                            (ADD (ADD (ADD V6 (S (ADD ZERO (ADD V4 V2))))
                                      (S (S (S (S V0)))))
                                 V5))
                       (S ZERO))))))))
