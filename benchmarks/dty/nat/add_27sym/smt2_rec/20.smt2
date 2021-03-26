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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat)) (= (s (s (add (s (add (s (add (s v4) (s v1))) (s (add (add (s v3) (add v5 (s (s (add v0 (s (s (s v3)))))))) (s (s zero)))))) (add (s (s v4)) (s v2))))) (add (add (s (s v0)) (s (s (s (s (add (s (s (s (s (s (add v2 (s v5))))))) (s (s (add zero (s (add (add (s v3) (s v1)) (add (s v3) v4)))))))))))) v4)))))
(check-sat)
