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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (add (s (add (s v7) (s (add (s (add (s v3) (s (s (s v8))))) (s (add v1 (add v4 (s v5)))))))) (s (s (add (s zero) (s (add (add v0 (s (s v6))) (s v2))))))) (add (s (add (s v7) (s (s (s v0))))) (s (add (s (add zero (s v8))) (add (s (s (s (s v3)))) (s (add v2 (s (add (s (s v4)) (s (add (add v6 v5) v1))))))))))))))
(check-sat)
