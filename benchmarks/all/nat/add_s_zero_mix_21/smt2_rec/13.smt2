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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (add (s (s (add (s v7) (s (add (add (s v2) v6) (s (s (add (s v5) zero)))))))) (s (add (add v1 (add (s v0) v3)) (s (s v4))))) (s (add (s (s (add (s (add (s (add (s (s (add (s v6) (add (add v5 v2) zero)))) (s (s v4)))) (s v3))) (add v7 (s v0))))) v1))))))
(check-sat)
