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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (add (add (add (s (s v9)) (s v7)) (add (s v2) v4)) (add (s v1) (s v3))) (add (s (add (s (s (s v0))) (s (s (s (s (s (s v5)))))))) (add v6 (s v8)))) (s (s (add v2 (add v3 (s (add (s (s (s (add (s v4) (s (s v6)))))) (add (add (s (s (s (s v9)))) (s v8)) (add v0 (s (add (s (add v1 (s v7))) v5))))))))))))))
(check-sat)
