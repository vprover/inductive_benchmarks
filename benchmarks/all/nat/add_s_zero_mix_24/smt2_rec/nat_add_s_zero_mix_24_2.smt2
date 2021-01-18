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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (s (add (add (s (add (s v3) (add (add (s v4) (add (s v6) v1)) (add (s (add v0 (s v3))) (add (s zero) v4))))) (add (s zero) zero)) (add (s v5) (s (s v2))))) (add (add zero (s (add (add (s (add v4 v6)) (s (s (s v1)))) (add (add zero v5) v4)))) (add (s (s (add v3 (s (s (add (s zero) (s (add (s v2) v3)))))))) v0))))))
(check-sat)
