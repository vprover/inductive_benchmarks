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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (s (add (add (s (add (s v0) (s v7))) (s (add (add (s v2) (s (add (s v5) v4))) (add v1 (add (s (s (add (s v7) v3))) v4))))) (add (s (add (s v6) (s v8))) (s v5)))) (s (add (add v8 (s (add (s (s v3)) (add v4 (s (s (s (add (add v0 (s v2)) (add (s v5) (s v5)))))))))) (add (s (s (s (add v6 v7)))) (s (add (add v7 v1) (s v4))))))))))
(check-sat)
