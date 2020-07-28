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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (add (s (s v9)) (s v5)) (s (s (add (add (add (s (add (s v3) (s v4))) (s (s v8))) (s (s (add (s v7) (add (add zero (s v7)) (s v0)))))) (add v6 (add (s v1) (s (s v2)))))))) (s (add v3 (s (s (add (s v6) (add (s (add v7 (add v2 (s (s (s (s v4))))))) (s (s (s (add (s v9) (s (add (add v0 v5) (add (s v8) (add (s (add (s v1) v7)) (s zero)))))))))))))))))))
(check-sat)
