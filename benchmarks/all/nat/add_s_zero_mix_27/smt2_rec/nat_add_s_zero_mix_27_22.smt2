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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (add (add (add (add (s (add (add (add (s (s zero)) v6) (add (s v2) (s zero))) (s (s (s v7))))) (s (s (add v5 (s v3))))) (s v4)) (add (s v6) (s v5))) (add v1 (s v0))) (s (add (add v3 (add (add (add v6 (s (s v7))) (s (add (s v1) (add v5 v0)))) (s (s zero)))) (add zero (s (add (s v6) (s (add (s (s v4)) (add v5 (s (s (s v2)))))))))))))))
(check-sat)
