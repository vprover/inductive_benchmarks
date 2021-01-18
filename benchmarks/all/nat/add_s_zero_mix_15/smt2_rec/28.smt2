(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(define-fun-rec add
    ((x nat) (y nat)) nat
    (match x
        ((zero y)
        ((s x0) (s (add x0 y)))
    )))
(define-fun-rec leq
    ((x nat) (y nat)) Bool
    (match x
        ((zero true)
        ((s x0)
            (match y
                ((zero false)
                ((s y0) (leq x0 y0))
            )))
    )))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat)) (= (s (s (s (add (add (add (s v0) (add (add v1 (s v4)) v3)) (s v5)) (add (s zero) (s v2)))))) (add (s (s (add zero (s (s (s v3)))))) (s (add v2 (add (s v5) (add v1 (s (add v4 v0)))))))))))
(check-sat)
