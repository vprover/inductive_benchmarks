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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (s (add zero (add (s v7) (add (s (add v2 (s v6))) (add v0 (s zero)))))) (s (add (add (s v1) (add (s (s (s (s (add (s v8) v9))))) (s (add v3 (s (s (s (s v5)))))))) (s v4)))) (s (s (s (add (add (s (add (s v1) (s (add v8 (s (add (s (s (s v3))) (s (add v9 (s v7))))))))) (add (add (add v6 (s (add zero (add v4 v2)))) (s (s (s (s v0))))) v5)) (s zero)))))))))
(check-sat)
