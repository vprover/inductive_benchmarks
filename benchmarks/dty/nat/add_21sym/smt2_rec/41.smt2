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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat)) (= (s (s (add (add (s (add (add (s v0) (add (s v1) v3)) (s (add (add v1 (s (s v4))) (s v2))))) (s v5)) (add zero (s (s v3)))))) (s (add (s (add (s (add (s (add (s (add (s (add (s (s (add (add v1 zero) v4))) (s v2))) (s v3))) (s v0))) v3)) (s v1))) v5))))))
(check-sat)
