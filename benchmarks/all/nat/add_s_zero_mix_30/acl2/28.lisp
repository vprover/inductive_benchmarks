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
   (S
    (S
     (ADD
       (S (ADD (S (S (ADD V3 (ADD (S V8) V0))))
               (ADD (S V1) V6)))
       (S (S (S (ADD (S V4)
                     (S (S (ADD (S (S (ADD (ADD (ADD V2 (S V8)) (S V5)) V7)))
                                (S (S V8))))))))))))
   (S
    (ADD
     V4
     (S
      (ADD
       V3
       (S
        (ADD
         (S V0)
         (ADD
          V6
          (S
           (ADD
            (ADD
             V8
             (S (S (S (ADD (ADD V7 V8)
                           (ADD (S (S V5))
                                (S (S (S (S (S (S (ADD (S V1) V2)))))))))))))
            (S (S V8))))))))))))))
