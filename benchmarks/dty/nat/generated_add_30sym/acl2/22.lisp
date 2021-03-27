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
     (= (ADD (S (S (ADD (S (S (ADD (S (ADD (ADD V1 (S V4)) V3))
                                   (S V8))))
                        V5)))
             (S (ADD (S (ADD V9
                             (S (ADD V8
                                     (ADD (S (S V2)) (ADD V0 (S (S V9))))))))
                     (S (ADD (S (S V7)) (S V6))))))
        (S (ADD (ADD (S V0) (S (S (S V1))))
                (S (ADD (ADD (ADD V4
                                  (ADD (S (ADD (ADD V9 V5) V8)) (S V9)))
                             V3)
                        (S (ADD (S (S (S (S V8))))
                                (S (ADD (S (ADD (S (S V6)) V7))
                                        (S V2))))))))))))
