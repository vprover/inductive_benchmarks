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
   (ADD (ADD (ADD (ADD (ADD (ADD (S V2) V7) ZERO) (S V9))
                  (S V8))
             (S V5))
        (ADD (S (S (S V3)))
             (ADD (ADD (S V9) (S (S (ADD V6 (S (S V1))))))
                  (S (ADD (S (S V4)) V0)))))
   (S
    (ADD
     (S
       (ADD (ADD V9
                 (S (ADD (ADD V6 (S V9))
                         (S (ADD V0
                                 (ADD (S (ADD (ADD (S V5) (S (S (S (S V8)))))
                                              V3))
                                      (ADD (S (ADD (S (S V1)) ZERO))
                                           (S V2))))))))
            V7))
     V4)))))
