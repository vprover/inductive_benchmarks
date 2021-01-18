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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (s (add (add (add (add (s v7) (s v4)) (add (s (add v0 (s (s v9)))) (s v1))) (s (add (add (s (s (add (s v6) (s v5)))) v2) (s v0)))) (add (s v7) (add (s v3) v8)))) (s (add v5 (s (add (s (s (add (add v6 (add v2 (s v1))) (add (s (add (s (s v7)) (add v0 (s (s (s (s (s v9)))))))) v0)))) (s (add (add (add v8 v3) v4) (s v7)))))))))))
(check-sat)
