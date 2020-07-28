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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (add (s (add (s (add v7 (add v3 (s v1)))) (add v1 (s v7)))) (add (add v6 (s v0)) (add (s v4) (add (add (s v3) v2) v5)))) (s (s (add (s (s v3)) (add v4 (add (add (add v5 (s (add (add v7 v0) v1))) v3) (s (add (add v2 (add v1 v7)) (s v6))))))))))))
(check-sat)
