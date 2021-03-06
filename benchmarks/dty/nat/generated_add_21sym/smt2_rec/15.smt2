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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (add (s (add v6 (s v5))) (add (add (add v3 (s v4)) (s zero)) (add (s (s (add v0 (s (s v4))))) (s (s (add v2 (s (s v1)))))))) (s (add (add (s (add v6 (s (add (s v2) v4)))) (add v4 v0)) (s (add v3 (s (add (s (s (s (s v1)))) (s (add zero (s v5)))))))))))))
(check-sat)
