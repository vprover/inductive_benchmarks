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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (add (s (s (add (s v5) (add (s (s (s (add (add v0 (s v4)) (s (add v8 (add (s v3) v2))))))) v1)))) (s (s (s (s (s (add v7 (s (s (add v6 (s v3))))))))))) (add (s (s (add v1 (s (s v8))))) (add (s (s v2)) (add (s v7) (s (s (add (s (add (add (add (s (s (add (s v0) v3))) (s (s v5))) v6) (s v3))) (s v4)))))))))))
(check-sat)
