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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (s (add (s (add (s v2) (add (add (s (s (s v0))) (s v1)) (s (s (s (s (s (add v4 (add v6 (add v6 (s v3)))))))))))) (s (s (s v5))))) (add (s (s (add v4 (add (add (s (s (s (add (s (s (s v6))) v3)))) (s (s (add (s (s (s (add v5 v2)))) (s (s v0)))))) v6)))) (s v1))))))
(check-sat)
