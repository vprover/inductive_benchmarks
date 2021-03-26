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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (s (s (add (s (add v7 (add (s v4) (add (add (s v3) v5) v0)))) (s (s (add (s (s v6)) (add (s (s (add (s v3) v8))) (add (add (s zero) v2) (s (add (s v1) v3)))))))))) (add v4 (add (s v8) (add (s (s (add (s (s v3)) (add (add (add (s (add zero (s (s (s (add (s v3) v1)))))) v3) (s v2)) (add v5 (add v7 (s (s v0)))))))) (s (s v6)))))))))
(check-sat)
