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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (add (s (s (s (add (s (s v1)) (s (s (s (s (add (add v2 (s (s (add (s v3) v4)))) (add v0 (s v5))))))))))) (s (s (s (s v6))))) (add (s (add (add (s (s (add (s v5) (s (s (s (s (s (s (s (s (s (add v0 v1))))))))))))) (s v4)) (add v2 (s (s (s v3)))))) v6)))))
(check-sat)
