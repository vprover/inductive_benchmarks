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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat)) (= (s (add (add zero (s v1)) (add (s (s (add (s (s v0)) (s (add (s (s (add (add (s v2) zero) (s v0)))) (add (s (s v3)) (s v1))))))) (s v1)))) (s (s (s (add (s (add (add (s (s (s zero))) v1) (add v0 zero))) (s (add v3 (add (add (add (s (s (s v2))) (s (s v1))) v0) (s (s v1)))))))))))))
(check-sat)
