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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat)) (= (add (add (s (add v3 (add (add v0 (s (s zero))) (s (add (s v2) (s v4)))))) (s (add (s zero) (s v1)))) (s v5)) (add (s (s (s (add zero (s v4))))) (s (s (add (add v0 v2) (add (s (s (add v5 (s v1)))) (add v3 (s zero)))))))))))
(check-sat)
