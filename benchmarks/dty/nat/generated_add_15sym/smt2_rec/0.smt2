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
(assert (not (forall ((v0 nat) (v1 nat)) (= (s (add (s (add (s (s v0)) (s (s v1)))) (s (s (add (s (s zero)) (s v0)))))) (add (s zero) (s (s (s (s (s (s (add (s (s (s v1))) (add (s v0) v0)))))))))))))
(check-sat)