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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (add (add v7 (s v4)) (add (add (add (s (s v3)) (s (add (s v0) v1))) (add v9 (s v1))) (s (add (s v1) (add (s v5) (s v6)))))) (s (s (s (s (add (s v8) v2)))))) (s (s (add (add (add (s v1) (add (s (s (add (s v2) (s (add v4 (s v1)))))) (s v6))) (s (s (s (add (add (s (s (add (s (add v8 (add v7 v0))) v9))) v3) v5))))) v1)))))))
(check-sat)
