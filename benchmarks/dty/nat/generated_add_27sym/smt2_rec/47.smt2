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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (add (add (s (s (s v7))) (s (add (add (add (s v2) v5) (s v6)) (s (s (add (add (s v0) v4) zero)))))) (add (s (s v1)) (add (s (s v0)) (s (s (s (s v3))))))) (s (add (add (s (add (s v2) (add (s (s v0)) (s (s (add v3 (add v0 v4))))))) (add (s (s zero)) (s (add (s v6) (add (s v7) v5))))) (s (s (s (s (s v1)))))))))))
(check-sat)
