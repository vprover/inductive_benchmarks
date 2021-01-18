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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (s (s (s v7))) (add (add v6 (s (s (add (s v4) (s v5))))) (add (s v8) (s (s (add (add (add v3 (add (s v7) v1)) (s (s zero))) (s (s (add v9 (s (add (s v2) (s v0)))))))))))) (add (add (add (s (s (add (add v4 (add (add (s v7) v1) v7)) (s (s (s (s (s (add (s v8) (s (s (s v9)))))))))))) v0) v2) (add (s v5) (add (s (s (add zero (s (s (s v3)))))) v6)))))))
(check-sat)
