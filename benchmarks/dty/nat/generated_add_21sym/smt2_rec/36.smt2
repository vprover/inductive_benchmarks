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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (s (add (add v6 (s v5)) (add (s (s (add (add (add (s v3) (add (s v2) v2)) (add (s v5) (s v6))) v1))) (add (add (s v0) v4) (s v2))))) (add (add v0 (add (add (s (s (s (add (s (s (s (add v6 (s (s (s v5))))))) v1)))) (add v6 (add v2 v2))) (add (add v2 v3) v5))) (s v4))))))
(check-sat)
