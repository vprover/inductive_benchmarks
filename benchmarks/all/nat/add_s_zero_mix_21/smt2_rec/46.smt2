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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat)) (= (add (s (s (add (s (s v1)) (add (add (add (add (s zero) (s (s v4))) (s v2)) (s v4)) (add v0 (s (s v3))))))) (add zero (s v0))) (s (add (add (add (s v4) (s zero)) v0) (add (s (add (s (s (add (add (s (s v2)) (s (s v3))) (add v0 v4)))) zero)) (s (s v1)))))))))
(check-sat)
