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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (add (s v6) (add v0 (add (s (add (s (add v3 (s (s (s v8))))) v1)) (s (s (s (s (s (s (s (add (add (s v7) v5) (add v2 (s v4))))))))))))) (add (s (add (add (s v2) (s (add (s (add (s (s (add (s v7) v1))) v4)) (s (add v6 v8))))) (s (s (add (s (s v0)) (s (s v5))))))) (s v3))))))
(check-sat)
