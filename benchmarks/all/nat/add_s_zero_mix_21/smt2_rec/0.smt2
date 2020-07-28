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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (s (add (add (add (s v7) v4) (s (s (s (s v5))))) (s (add (s (add (s (s v2)) (add (s v1) (add v0 (s v3))))) (s v6))))) (s (s (add (add (s (s v2)) (s (s v7))) (add (add (s (add v3 (add v6 (s (s (s (add v1 v4))))))) (s (s (s v5)))) v0))))))))
(check-sat)
