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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (s (add (s (s (add (s v0) v6))) (s (s (add (s v5) (add (s (s (add (s v3) v7))) (s (s (s (s (add (add (s (s v4)) (s v2)) (add (s v1) v8)))))))))))) (add (s (add v2 (s (s (s v3))))) (add (s (s (s (s (add (s (s (add (s (s (add (s (add (s v5) (s (add v4 (s v0))))) (s v7)))) (s v1)))) v6))))) v8))))))
(check-sat)
