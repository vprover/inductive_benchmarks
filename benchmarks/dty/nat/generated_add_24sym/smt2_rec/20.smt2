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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (s (s (s (add (add (s v2) (s (add (s v8) (add (s (s (s (add v4 (add v3 (s v7)))))) (add (add (s v0) v7) (add (s v6) v1)))))) (s (s v5)))))) (add v6 (s (add (add (s (s (add v7 v7))) (s (s (s (add (s (add (s (add (s v3) (s v1))) (s v0))) (add (add v4 (s (s v2))) v8)))))) (s v5))))))))
(check-sat)
