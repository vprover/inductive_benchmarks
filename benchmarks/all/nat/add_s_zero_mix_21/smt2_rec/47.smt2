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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (s (s (add (s (add (s (s (add (s v2) v3))) (s v5))) (s (s (add (s (s v6)) (add (add (s v4) (s (s v0))) v1))))))) (s (s (add (add v6 v1) (s (s (s (add (s v5) (s (s (add v4 (s (add (s (s (s v3))) (s (s (add v0 v2)))))))))))))))))))
(check-sat)
