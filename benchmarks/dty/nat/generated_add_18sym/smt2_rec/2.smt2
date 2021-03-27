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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat)) (= (s (add (s (s (add v1 (s v3)))) (add (add (s v4) (s v5)) (s (add (add (s v0) (s (s zero))) (s v2)))))) (add zero (add (s (s (add (add v1 (s (s (add (s v2) (s (add (s (s (s (s (s v5))))) v3)))))) v4))) v0))))))
(check-sat)
