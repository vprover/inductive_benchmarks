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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (add (add (add (s zero) (add (s (add (s v6) v7)) (add v3 (s v4)))) (s (s (s v2)))) (s (add (s (add (s v1) v8)) (s (add (s v5) (add (s v4) v0)))))) (s (s (add (add (s (s (s (add (add (add (s v4) v4) (add (add v8 v5) (s (s (s (add v3 (s (s (s (add v2 (add v6 (s v0)))))))))))) zero)))) v7) v1)))))))
(check-sat)
