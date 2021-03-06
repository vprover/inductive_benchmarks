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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (s (s (add (add (s (add (s (s (s (add (s v4) v7)))) (s (add (s (s v1)) (add (s (s (s v3))) (s zero)))))) (s (s v6))) (s (add (add v2 (s v0)) (s (s (s v5)))))))) (s (s (s (s (add (s (add (add v0 v2) (s (add (s zero) (s (add (s (s (s (s v4)))) (add (s (s v7)) v1))))))) (add v3 (s (s (add (s (s (s (s v5)))) (s v6))))))))))))))
(check-sat)
