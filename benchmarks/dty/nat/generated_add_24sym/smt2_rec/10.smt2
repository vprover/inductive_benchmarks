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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (add (s (add (s (s (s (add (s v3) (add (s (add (s v7) (s v2))) (s v4)))))) (s (add (s v5) (s (s v5)))))) (add (s (add v6 (s v0))) v1)) (s (s (s (s (add (add (s (add (add (s (s v1)) (add v7 v4)) (s v6))) v0) (add (s (add v5 v3)) (s (add (s (s (s (s (s v5))))) v2))))))))))))
(check-sat)
