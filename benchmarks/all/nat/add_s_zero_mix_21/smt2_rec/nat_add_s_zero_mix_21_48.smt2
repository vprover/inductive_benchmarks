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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (s (add (add (add (add (s (add v3 (s (s v4)))) (add (add (add v0 (s v2)) (add (s v9) v8)) (s v6))) (add v5 (s v8))) (s v7)) (s v1))) (add (s v9) (s (add (add v1 v4) (add v8 (s (s (s (add (add v3 v8) (add v7 (add (s (s v5)) (s (add (add v0 (s (s v6))) v2))))))))))))))))
(check-sat)
