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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (add (s (add (s v4) (add v3 (s v0)))) (s (s (s (add (add (add (s v5) (s v5)) (s v6)) (add v2 (s v1))))))) (s (add (add (add (add v5 v5) (s (s (s (s v2))))) (s v3)) (s (add (add (s v6) v1) (s (add (s v0) v4))))))))))
(check-sat)
